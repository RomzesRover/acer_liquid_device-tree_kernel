#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

#ME=$(whoami)@$(hostname)

# SPECIAL FOR THEPASTO )))

#if [[ $ME == "thepasto@laptop" ]];then
#	export J2SDKDIR=/opt/java6
#	export J2REDIR=$J2SDKDIR/jre
#	export JAVA_HOME=$J2SDKDIR
#fi

add_lunch_combo cm_salsa-userdebug
add_lunch_combo cm_salsa-eng
add_lunch_combo cm_salsa-user
echo ""
echo "Patching Salsa Workspace..."
echo ""
for p in $(find device/acer/salsa/patches/ -name "*.diff") 
	do 
		echo -n "Apply patch "$(basename $p | awk -F"." '{print $1}')
		patch -p1 < $p > /dev/null 2>&1
		if [ $? == 0 ]; then
			echo "     [DONE]"
		else
			echo "     [FAIL]"
		fi
		echo "" 
	done
echo ""
echo "Copying ic_settings_liquidp.png to packages/apps/Settings/res/drawable-hdpi/ic_settings_liquidp.png..."
cp device/acer/salsa/proprietary/system/app/Settings/res/drawable-hdpi/ic_settings_liquidp.png packages/apps/Settings/res/drawable-hdpi/ic_settings_liquidp.png
echo ""
