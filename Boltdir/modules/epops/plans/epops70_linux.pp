plan epops::epops70_linux(
  TargetSpec $nodes,
  String     $installdir = 'vmware',
) {
  $resultset = run_task('epops::ep_check', $nodes, '_catch_errors' => true)
  $resultset.each |$result| {
    $node = $result.target.name
    if $result.ok {
      notice("Info: Node '${node}' already contains the EPOps Agent, skipping.")
    } else {
      notice("Info: Node '${node}' requires installation of the EPOps Agent, continuing")
      run_task('epops::ep_install', $node, installdir => $installdir)
      run_command("rm /opt/${installdir}/epops-agent-7.0.0/conf/agent.properties --force", $node)
      upload_file('epops/linux-agent.properties', "/opt/${installdir}/epops-agent-7.0.0/conf/agent.properties", $node)
      run_task('epops::ep_start', $node, installdir => $installdir)
    }
  }
}
