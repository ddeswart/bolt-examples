plan epops::test(
  TargetSpec $nodes,
  String     $installdir = "vmware",
) {
  $result = run_task("epops::ep_check", $nodes)
  notice("Result: ${result}")
  $filtered_result = $result.filter | $output | {$output =~ "EPOps install directory found"}
  notice("${filtered_result}")
}
