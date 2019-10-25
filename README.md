# Openshift (4) SimpleSample

A very simple sample project that works with Openshift 4. 

This is a simple sample demo script for deploying an app.                        

Pre-requisites in the project are:                                               
     * a secret to pull the git - referenced in the template as gitsecret          
     * a secret to pull the image - referenced in the template as img-pull-secret  
     (hint) samples exist in this folder and can be added with oc apply -f <file>  
  The app template creates:                                                        
     * a reference to a remote image - baseimage                                   
     * a reference to the app image - where sucessful builds push the image        
     * a build configuration - docker strategy, baseimage + sample.war = image     
     * an app definition - creates an app once a (new) built image is available    
     * a service definition - expose the app ports internally in the project       
     * a route definition - expose one of the services externally                  
     (hint) pulling the remote image will not work without the secret              
     (hint) the build will fail if git is not correctly configured                
     (hint) a way to start a local build overriding git exists in this script      

################################################################################### 

There is also a deployment script that deploys the 

You also need a working oc binary in the PATH. Do not forget to login to an Openshift instance before running the script.

