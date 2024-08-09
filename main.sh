#!/bin/bash -e
# shellcheck disable=SC1091

declare -rx STEPS=(
  'Update-all-Nodes'
  'Add-etc-Modules'
  'Update-Systemctl'
  'Download-Docker'
  'Install-Config-Containerd'
  'Install-Kubernetes-Components'
  )
declare -rx CMDS=(
  'source kubernetes-steps/Update-all-Nodes.sh'
  'source kubernetes-steps/Add-etc-Modules.sh'
  'source kubernetes-steps/Update-Systemctl.sh'
  'source kubernetes-steps/Download-Docker.sh'
  'source kubernetes-steps/Install-Config-Containerd.sh'
  'source kubernetes-steps/Install-Kubernetes-Components.sh'
)

case $1 in
  progress)
    . 'progress.sh'
    ;;
  progress_advanced)
    . 'progress_advanced.sh'
    ;;
  spinner*)
    . 'spinner.sh'
    ;;
  *)
    echo "Invalid option $1!"
    exit 1
esac

start