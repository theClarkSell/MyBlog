---
layout: post 
title: "Stop, the build is broken!!"
subTitle: 
heroImageUrl: 
date: 2006-10-26
tags: ["TeamBuild","VSTS"]
keywords: 
---

It's late, your tired and yet somehow you got stuck fixing the build because junior engineer bob just fired off a check-in and took off.&nbsp; It looks like the build is now broken because junior hasn't done a get latest in a month.&nbsp; In the meantime 10 other people check-in and just end up compounding the problem.

Unfortunately things like this happen.&nbsp; One day I just got so frustrated, I just wrote a custom TFS check-in policy which gets the last build status and validates a particular build type was actually passing before you check-in.&nbsp; I started with&nbsp;[Jeff Atwood](http://blogs.vertigosoftware.com/teamsystem/archive/2006/02/27/2302.aspx) and [James Manning](http://blogs.msdn.com/jmanning/default.aspx) posts where they have done a great job explaining how to write a simple custom check-in policies.

Let's Code!!

There are two things you have to do for any check-in policy, define the policy and configure it.&nbsp; This sample isn't much different than the code comment examples.&nbsp; 

First lets look at the policy definition. The real work is in the&nbsp;Evaluate method.&nbsp; This&nbsp;is where we call TFS and find out what state the build is in. This sample could further be updated and remove the requirement to configure the TfsServer.&nbsp; You can actually get that info from the workspace IPendingCheckin supplied in Initialize() (_pendingCheckin.PendingChanges.Workspace).&nbsp; From the Workspace object, it's workspace.VersionControlServer.TeamFoundationServer.
 > <pre><span style="color: #0000ff">using</span> System;> 
> <span style="color: #0000ff">using</span> System.Diagnostics;> 
> <span style="color: #0000ff">using</span> System.Windows.Forms;> 
> <span style="color: #0000ff">using</span> Microsoft.TeamFoundation.VersionControl.Client;> 
> 
> <span style="color: #0000ff">using</span> Microsoft.TeamFoundation.Client;> 
> <span style="color: #0000ff">using</span> Microsoft.TeamFoundation.Build.Proxy;> 
> <span style="color: #0000ff">using</span> System.Text;> 
> 
> <span style="color: #0000ff">namespace</span> Microsoft.Services.TfsPolicies> 
> {> 
> 		[Serializable]> 
> 		<span style="color: #0000ff">public</span> <span style="color: #0000ff">class</span> BuildStatusPolicy : PolicyBase> 
> 		{> 
> 				<span style="color: #0000ff">string</span> _tfsServer = @"<span style="color: #8b0000">http://TFSServer:8080</span>";> 
> 				<span style="color: #0000ff">string</span> _tfsProject = "<span style="color: #8b0000">TfsProject</span>";> 
> 				<span style="color: #0000ff">string</span> _buildType = "<span style="color: #8b0000">BuildType</span>";> 
> 
> 				[NonSerialized]> 
> 				<span style="color: #0000ff">protected</span> <span style="color: #0000ff">bool</span> _disposed = <span style="color: #0000ff">false</span>;> 
> 				[NonSerialized]> 
> 				<span style="color: #0000ff">protected</span> IPendingCheckin _pendingCheckin;> 
> 
> 				<span style="color: #008000">//public virtual event PolicyStateChangedHandler PolicyStateChanged;</span>> 
> 
> 				#region IPolicyDefinition> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">string</span> Description> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> Strings.PolicyDescription; }> 
> 				}> 
> 
> 				<span style="color: #008000">// This string is a description of the type of our policy.  It will be displayed to the</span>> 
> 				<span style="color: #008000">// user when they select our policy type in the list of policies installed on the system</span>> 
> 				<span style="color: #008000">// as mentioned above.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">string</span> TypeDescription> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> Strings.PolicyTypeDescriptions; }> 
> 				}> 
> 
> 				<span style="color: #008000">// This string is the type of our policy.  It will be displayed to the user in a list</span>> 
> 				<span style="color: #008000">// of all installed policy types when they are creating a new policy.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">string</span> Type> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> Strings.PolicyType; }> 
> 				}> 
> 
> 				<span style="color: #008000">// This is a string that is stored with the policy definition on the source</span>> 
> 				<span style="color: #008000">// control server.  If a user does not have our policy plugin installed, this string</span>> 
> 				<span style="color: #008000">// will be displayed.  We can use this as an opportunity to explain to the user</span>> 
> 				<span style="color: #008000">// how they might go about installing our policy plugin.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">string</span> InstallationInstructions> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> Strings.PolicyInstallInstructions; }> 
> 				}> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">bool</span> CanEdit> 
> 				{> 
> 						<span style="color: #008000">//TODO maybe check the role of the user trying to change?</span>> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> <span style="color: #0000ff">true</span>; }> 
> 				}> 
> 
> 				#endregion <span style="color: #008000">//IPolicyDefinition</span>> 
> 
> 				#region IPolicyDefinition> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">void</span> Initialize(IPendingCheckin pendingCheckin)> 
> 				{> 
> 						<span style="color: #0000ff">if</span> (_pendingCheckin != <span style="color: #0000ff">null</span>)> 
> 						{> 
> 								<span style="color: #0000ff">throw</span> <span style="color: #0000ff">new</span> InvalidOperationException("<span style="color: #8b0000">Policy already initialized.</span>");> 
> 						}> 
> 
> 						<span style="color: #0000ff">if</span> (_disposed)> 
> 						{> 
> 								<span style="color: #0000ff">throw</span> <span style="color: #0000ff">new</span> ObjectDisposedException(<span style="color: #0000ff">null</span>);> 
> 						}> 
> 
> 						_pendingCheckin = pendingCheckin;> 
> 
> 						pendingCheckin.PendingChanges.CheckedPendingChangesChanged += <span style="color: #0000ff">new</span> EventHandler(pendingCheckin_CheckedPendingChangesChanged);> 
> 				}> 
> 
> 				<span style="color: #008000">// This method is invoked by the policy framework when the user creates a new checkin</span>> 
> 				<span style="color: #008000">// policy or edits an existing checkin policy.  We can use this as an opportunity to</span>> 
> 				<span style="color: #008000">// display UI specific to this policy type allowing the user to change the parameters</span>> 
> 				<span style="color: #008000">// of the policy.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">bool</span> Edit(IPolicyEditArgs policyEditArgs)> 
> 				{> 
> 						<span style="color: #0000ff">if</span> (_pendingCheckin != <span style="color: #0000ff">null</span>)> 
> 						{> 
> 								<span style="color: #0000ff">throw</span> <span style="color: #0000ff">new</span> ApplicationException("<span style="color: #8b0000">The policy can't be edited after it has been initialized for evaluation.</span>");> 
> 						}> 
> 
> 						<span style="color: #0000ff">using</span> (BuildStatusPolicyConfiguration buildStatusPolicyConfiguration = <span style="color: #0000ff">new</span> BuildStatusPolicyConfiguration(_tfsServer, _tfsProject, _buildType))> 
> 						{> 
> 								DialogResult formResult = buildStatusPolicyConfiguration.ShowDialog(policyEditArgs.Parent);> 
> 
> 								<span style="color: #0000ff">if</span> (formResult == DialogResult.OK)> 
> 								{> 
> 										_buildType = buildStatusPolicyConfiguration.TfsBuildType;> 
> 										_tfsProject = buildStatusPolicyConfiguration.TfsProject;> 
> 										_tfsServer = buildStatusPolicyConfiguration.TfsServer;> 
> 
> 										<span style="color: #0000ff">return</span> <span style="color: #0000ff">true</span>;> 
> 								}> 
> 								<span style="color: #0000ff">return</span> <span style="color: #0000ff">false</span>;> 
> 						}> 
> 				}> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> PolicyFailure[] Evaluate()> 
> 				{> 
> 						<span style="color: #0000ff">if</span> (_disposed)> 
> 						{> 
> 								<span style="color: #0000ff">throw</span> <span style="color: #0000ff">new</span> ObjectDisposedException(<span style="color: #0000ff">null</span>);> 
> 						}> 
> 
> 						TeamFoundationServer teamFoundationServer = TeamFoundationServerFactory.GetServer(_tfsServer);> 
> 						BuildStore buildStore = teamFoundationServer.GetService(<span style="color: #0000ff">typeof</span>(BuildStore)) <span style="color: #0000ff">as</span> BuildStore;> 
> 
> 						BuildData[] buildData = buildStore.GetListOfBuilds(_tfsProject, _buildType);> 
> 
> 						BuildData lastBuild = <span style="color: #0000ff">this</span>.getLastBuild(buildData);> 
> 
> 						StringBuilder sb = <span style="color: #0000ff">new</span> StringBuilder();> 
> 						sb.AppendFormat("<span style="color: #8b0000">Builds Returned: {0} \n</span>", buildData.Length.ToString());> 
> 						sb.AppendFormat("<span style="color: #8b0000">Build Status: {0} \n</span>", lastBuild.BuildStatus);> 
> 						sb.AppendFormat("<span style="color: #8b0000">Build Status ID: {0} \n</span>", lastBuild.BuildStatusId);> 
> 						sb.AppendFormat("<span style="color: #8b0000">Finish Time: {0} \n</span>", lastBuild.FinishTime);> 
> 						sb.AppendFormat("<span style="color: #8b0000">Build Number: {0} \n</span>", lastBuild.BuildNumber);> 
> 
> 						EventLog.WriteEntry("<span style="color: #8b0000">Microsoft.Services.TfsPolicies</span>", sb.ToString());> 
> 
> 						<span style="color: #0000ff">if</span> (lastBuild.BuildStatus.Equals("<span style="color: #8b0000">Failed</span>", StringComparison.OrdinalIgnoreCase))> 
> 						{> 
> 								<span style="color: #0000ff">return</span> <span style="color: #0000ff">new</span> PolicyFailure[] { <span style="color: #0000ff">new</span> PolicyFailure(<span style="color: #0000ff">string</span>.Format(Strings.PolicyPrompt, _buildType), <span style="color: #0000ff">this</span>) };> 
> 						}> 
> 						<span style="color: #0000ff">else</span>> 
> 						{> 
> 								<span style="color: #0000ff">return</span> <span style="color: #0000ff">new</span> PolicyFailure[0];> 
> 						}> 
> 				}> 
> 
> 				<span style="color: #008000">// This method is called if the user double-clicks on a policy failure in the UI.</span>> 
> 				<span style="color: #008000">// We can handle this as we please, potentially prompting the user to perform</span>> 
> 				<span style="color: #008000">// some activity that would eliminate the policy failure.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">void</span> Activate(PolicyFailure failure)> 
> 				{> 
> 						MessageBox.Show(<span style="color: #0000ff">string</span>.Format(Strings.PolicyPrompt, _buildType), "<span style="color: #8b0000">How to fix your policy failure</span>");> 
> 				}> 
> 
> 				<span style="color: #008000">// This method is called if the user presses F1 when a policy failure is active in the UI.</span>> 
> 				<span style="color: #008000">// We can handle this as we please, displaying help in whatever format is appropriate.</span>> 
> 				<span style="color: #008000">// For this example, we'll just pop up a dialog.</span>> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">void</span> DisplayHelp(PolicyFailure failure)> 
> 				{> 
> 						MessageBox.Show(<span style="color: #0000ff">string</span>.Format(Strings.PolicyDisplayHelp, _buildType), "<span style="color: #8b0000">Prompt Policy Help</span>");> 
> 				}> 
> 
> 				#endregion IPolicyDefinition> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> pendingCheckin_CheckedPendingChangesChanged(Object sender, EventArgs e)> 
> 				{> 
> 						<span style="color: #0000ff">if</span> (!_disposed)> 
> 						{> 
> 								OnPolicyStateChanged(Evaluate());> 
> 						}> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> BuildData getLastBuild(BuildData[] builds)> 
> 				{> 
> 						DateTime lastBuildDateTime = builds[0].FinishTime;> 
> 
> 						<span style="color: #0000ff">int</span> position = 0;> 
> 
> 						<span style="color: #0000ff">for</span> (<span style="color: #0000ff">int</span> i = 0; i < builds.Length; i++)> 
> 						{> 
> 								<span style="color: #0000ff">if</span> (builds[i].FinishTime > lastBuildDateTime)> 
> 								{> 
> 										lastBuildDateTime = builds[i].FinishTime;> 
> 										position = i;> 
> 								}> 
> 						}> 
> 
> 						<span style="color: #0000ff">return</span> builds[position];> 
> 				}> 
> 		}> 
> }</pre>

&nbsp;

Now lets configure it.

> <pre><span style="color: #0000ff">using</span> System;> 
> <span style="color: #0000ff">using</span> System.Collections.Generic;> 
> <span style="color: #0000ff">using</span> System.ComponentModel;> 
> <span style="color: #0000ff">using</span> System.Data;> 
> <span style="color: #0000ff">using</span> System.Drawing;> 
> <span style="color: #0000ff">using</span> System.Text;> 
> <span style="color: #0000ff">using</span> System.Windows.Forms;> 
> 
> <span style="color: #0000ff">namespace</span> Microsoft.Services.TfsPolicies> 
> {> 
> 		<span style="color: #0000ff">public</span> partial <span style="color: #0000ff">class</span> BuildStatusPolicyConfiguration : Form> 
> 		{> 
> 				<span style="color: #0000ff">public</span> BuildStatusPolicyConfiguration(<span style="color: #0000ff">string</span> TfsServer, <span style="color: #0000ff">string</span> TfsProject, <span style="color: #0000ff">string</span> TfsBuildType  )> 
> 				{> 
> 						InitializeComponent();> 
> 
> 						txtTfsUrl.Text = TfsServer;> 
> 						txtTfsProject.Text = TfsProject;> 
> 						txtTfsBuildType.Text = TfsBuildType;> 
> 
> 						<span style="color: #0000ff">this</span>.txtTfsBuildType_TextChanged(<span style="color: #0000ff">null</span>, <span style="color: #0000ff">null</span>);> 
> 						<span style="color: #0000ff">this</span>.txtTfsProject_TextChanged(<span style="color: #0000ff">null</span>, <span style="color: #0000ff">null</span>);> 
> 						<span style="color: #0000ff">this</span>.txtTfsUrl_TextChanged(<span style="color: #0000ff">null</span>, <span style="color: #0000ff">null</span>);> 
> 				}> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">string</span> TfsServer> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> <span style="color: #0000ff">this</span>.txtTfsUrl.Text; }> 
> 				}> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">string</span> TfsProject> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> <span style="color: #0000ff">this</span>.txtTfsProject.Text; }> 
> 				}> 
> 
> 				<span style="color: #0000ff">public</span> <span style="color: #0000ff">string</span> TfsBuildType> 
> 				{> 
> 						<span style="color: #0000ff">get</span> { <span style="color: #0000ff">return</span> <span style="color: #0000ff">this</span>.txtTfsBuildType.Text; }> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> btnOk_Click(<span style="color: #0000ff">object</span> sender, EventArgs e)> 
> 				{> 
> 						DialogResult = DialogResult.OK;> 
> 						Close();> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> txtTfsUrl_TextChanged(<span style="color: #0000ff">object</span> sender, EventArgs e)> 
> 				{> 
> 						btnOK.Enabled = txtTfsUrl.Text != <span style="color: #0000ff">string</span>.Empty;> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> txtTfsProject_TextChanged(<span style="color: #0000ff">object</span> sender, EventArgs e)> 
> 				{> 
> 						btnOK.Enabled = txtTfsProject.Text != <span style="color: #0000ff">string</span>.Empty;> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> txtTfsBuildType_TextChanged(<span style="color: #0000ff">object</span> sender, EventArgs e)> 
> 				{> 
> 						btnOK.Enabled = txtTfsBuildType.Text != <span style="color: #0000ff">string</span>.Empty;> 
> 				}> 
> 
> 				<span style="color: #0000ff">private</span> <span style="color: #0000ff">void</span> btnCancel_Click(<span style="color: #0000ff">object</span> sender, EventArgs e)> 
> 				{> 
> 						Close();> 
> 				}> 
> 		}> 
> }</pre>

Lastly I dropped the strings into their own struct.

> <pre><span style="color: #0000ff">using</span> System;> 
> <span style="color: #0000ff">using</span> System.Collections.Generic;> 
> <span style="color: #0000ff">using</span> System.Text;> 
> 
> <span style="color: #0000ff">namespace</span> Microsoft.Services.TfsPolicies> 
> {> 
> 		<span style="color: #0000ff">internal</span> <span style="color: #0000ff">struct</span> Strings> 
> 		{> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyDescription = "<span style="color: #8b0000">Stop users from checking in when the configured BuildType is in a 'Failed' status.</span>";> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyTypeDescriptions = "<span style="color: #8b0000">This policy will prompt the user to decide whether or not they should be allowed to check in based on the build status.</span>";> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyType = "<span style="color: #8b0000">Check for passing build</span>";> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyInstallInstructions = "<span style="color: #8b0000">Please install the package Microsoft.Services.TfsPolicies.Setup.msi.</span>";> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyPrompt = "<span style="color: #8b0000">Please wait to check-in until the {0} build is passing</span>";> 
> 				<span style="color: #0000ff">internal</span> <span style="color: #0000ff">const</span> <span style="color: #0000ff">string</span> PolicyDisplayHelp = "<span style="color: #8b0000">This validates the {0} build status is not in failure</span>";> 
> 		}> 
> }</pre>

**One thing to note, be aware of performance.**&nbsp;&nbsp;This just&nbsp;does the mechanics and is not optimized.&nbsp; During the course of a check-in this will actually call the web service a number of different times.&nbsp; On top of that the web service endpoint only returns all build results for a build type rather than just the last one.&nbsp; So depending on your team size etc.&nbsp;you've now been warned.&nbsp; Sometimes a performance hit is worth the productivity gained.