@echo off

rem ########## V A R I A B L E S    D E F I N I T I O N  #########
echo "###################################################################################"
echo "  This is a simple sample demo script for deploying an app.                        "
echo "  Pre-requisites in the project are:                                               "
echo "     * a secret to pull the git - referenced in the template as gitsecret          "
echo "     * a secret to pull the image - referenced in the template as img-pull-secret  "
echo "     (hint) samples exist in this folder and can be added with oc apply -f <file>  "
echo "  The app template creates:                                                        "
echo "     * a reference to a remote image - baseimage                                   "
echo "     * a reference to the app image - where sucessful builds push the image        "
echo "     * a build configuration - docker strategy, baseimage + sample.war = image     "
echo "     * an app definition - creates an app once a (new) built image is available    "
echo "     * a service definition - expose the app ports internally in the project       "
echo "     * a route definition - expose one of the services externally                  "
echo "     (hint) pulling the remote image will not work without the secret              "
echo "     (hint) the build will fail if git is not correctly configured                 "
echo "     (hint) a way to start a local build overriding git exists in this script      "
echo "###################################################################################" 

rem ########## V A R I A B L E S    D E F I N I T I O N  #########
rem "Defining variables to use..."

set WAR_FILE="SampleWebApp.war"
set PROJECT_NAME="mihai"

echo.
echo.
set /p DUMMY="Press enter to continue, CTRL+C to stop the execution..."

rem ########## DEPLOY TEMPLATE
echo.
echo Creating/Modifying SampleWebApp in the CI/CD project...
oc process -f app-template.yaml -p WAR_FILE="%WAR_FILE%"  | oc apply -n "%PROJECT_NAME%" -f - 

rem ########## P R O C E S S    C O M P L E T E D
echo.
echo.
echo Process finished!!! Review the log for errors.
