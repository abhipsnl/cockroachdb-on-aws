#!/bin/bash

# =================================================================================================
#
#
#      Script : trigger-full-automation.sh
#
# Description : Script to trigger full setup for cockroachdb on AWS
#       flow  : setup s3 backend for terraform ---> generate ssh keys  --> run final terraform
#
#
# =================================================================================================

ECHO_CMD="echo -ne"
red='\033[1;91m'
blue='\033[1;94m'
bold='\033[1m'
under_line='\033[1;4m'
yellow='\033[1;93m'
norm='\033[0m'
green='\033[1;92m'
cyan='\033[1;36m'

function display_message() {
    # Display function
    TEXT="$1"
    MSG="$2"

    if [ "${MSG}" == "ERROR" ];then
        ${ECHO_CMD}  "${red}"
         ${ECHO_CMD}  "${TEXT}" | awk -v msg="${MSG}" '{printf("%5s %-140s %10s\n","",$0,"[ "msg" ]")}'
    elif [ "${MSG}" == "OK" ];then
        ${ECHO_CMD}  "${green}"
        ${ECHO_CMD} "${TEXT}" | awk -v msg="${MSG}" '{printf("%5s %-140s %10s\n","",$0,"[ "msg" ]")}'
    elif [ "${MSG}" == "INFO" ];then
        ${ECHO_CMD}  "${bold}"
        ${ECHO_CMD} "${TEXT}" | awk -v msg="${MSG}" '{printf("%5s %-140s %10s\n","",$0,"[ "msg" ]")}'
    elif [ "${MSG}" == "WARN" ];then
        ${ECHO_CMD}  "${yellow}"
        ${ECHO_CMD} "${TEXT}" | awk -v msg="${MSG}" '{printf("%5s %-140s %10s\n","",$0,"[ "msg" ]")}'
    elif [ "${MSG}" == "SKIPPED" ];then
        ${ECHO_CMD}  "${cyan}"
        ${ECHO_CMD} "${TEXT}" | awk -v msg="${MSG}" '{printf("%5s %-140s %10s\n","",$0,"[ "msg" ]")}'
    fi
    ${ECHO_CMD} "$norm"
}

function setup_s3_backend() {
    display_message "Preparing s3 backend for terraform" "INFO"
}

setup_s3_backend
