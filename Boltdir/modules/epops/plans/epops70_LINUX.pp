plan epops::epops70_LINUX(
  TargetSpec $nodes,
  String     $installdir = "vmware",
) {
  $result=run_task("epops::ep_check", $nodes)
  notice("Result: ${result}")

  if [$result =~ "EPOps install directory NOT found"] {
    run_task("epops::ep_install", $nodes, installdir => $installdir)
    run_command("rm /opt/${installdir}/epops-agent-7.0.0/conf/agent.properties --force", $nodes)
    upload_file("epops/lnx-agent.properties", "/opt/${installdir}/epops-agent-7.0.0/conf/agent.properties", $nodes)
    run_task("epops::ep_start", $nodes, installdir => $installdir)
  }
}
