<!--- MMC.CFM 

	I AM THE ONE FILE, MAGICAL, MEGA MURA MANAGEMENT CONSOLE.  Of course I should be a nicely organized folder based app, but I like being dropped in anywhere and just working.

	This file has been hacked together in a few hour setting.  Still have to clean it up but I don't mind putting it out there if you'll look past any eyesores for now.

	--->



	<!--- PRE AMBLE:  This file is setup as a switch that renders the screens that are needed.  As a result it's pretty long.   Did my best to set things up as functions so I can break it up or grow it one day if it's needed.  Until then, this should work

		SECTIONS OF THIS FILE:

		HTML RENDERER - Renders each screen

		LAYOUT FUNCTIONS --> Provides the sub area info

		CONTENT FUNCTIONS --> Stores the content for each page

		CONSOLE FUNCTIONS --> All of the functions called in the renderContent to compelte the steps to setup a new site --->


<!--- MMC SETUP --->
	<cfset mmcVersion = "0.01">

	<!--- Set up a default view --->
	<cfparam name = "url.action" default = "main.home" />


<!--- HTML RENDERER START --->
<!--- HTML RENDERER RENDERS EVERY SCREEN --->


	<!DOCTYPE html>
	<html lang = "en">
	  <head>
	    <meta charset = "utf-8">

     	<title>Mura Management Console - Jas Panesar</title>		


     	<!--- STYLING START --->

	   	<!--- Call to the function
	   	<script type = "text/javascript">
	   		<cfoutput>#getBootstrap()#</cfoutput>
	   	</script> --->

	   	<link rel = "stylesheet" href = "http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css">
		<style type = "text/css">
		 body {
			padding-top: 60px;
		 }
		</style>
		<!--- STYLING END --->
	  </head>

	  <cfoutput>
	  <body>
	 
	 	<!--- Render the header bar --->
	 	#renderHeader()#

	 	<!--- MAIN CONTAINER START --->

			 <div class = "container-fluid">

			 	<!--- render the sidebar --->
			 	#renderLayoutSidebar()#

			      <div class = "content">

			      	#renderContent(action=url.action)#

			      	<!-- FOOTER-START -->
			      	#renderFooter()#
			      	<!-- FOOTER-END -->
			      </div>
			    </div>

	 	<!--- MAIN CONTAINER END --->

	  </body>
	  </cfoutput>
	  
	</html>


<!--- HTML RENDERER END --->








<!--- LAYOUT FUNCTIONS START --->


	<!--- I GET THE CONTENT FOR THE CURRENT ACTION --->

	<cffunction name = "renderContent" returntype = "any" output = "true" displayname = "getContent" 
				hint = "I get the content for any page" description = "I am the mega switch between all the page that finds all the content and commands and does it all.">

		<cfargument name = "action" type = "string" required = "true" 
					hint = "the action that we're rendering" />


		<!--- HAMMER TIME --->
		<cfswitch expression = "#arguments.action#">
			
			<cfcase value = "main.home">
				<!--- I display the main home page of MMC --->
				
				#getMainHome()#

			</cfcase>

			<cfcase  value = "main.contact">
				<!--- I display the contact information --->
				
				#getMainContact()#

			</cfcase>


			<cfcase  value = "main.createSite">
				<!--- I create the site after main.newSite posts to me --->


				<!--- FUNCTION CALLS GO HERE --->
				<cfset installMura() />

				#getMainCreateSite()# <!--- put this at the end of the commands to display the results --->

			</cfcase>


			<cfcase value = "main.license">
				<!--- I display the license --->

				#getMainLicense()#

			</cfcase>


			<cfcase  value = "main.newSite">
				<!--- I show the form to create a new site --->

				<!---<cfset gitPath = getGitLocation( cgi.HTTP_USER_AGENT ) />--->

				#getMainNewSite()#
				
			</cfcase>


			<cfcase  value = "main.requirements">
				<!--- I display the requirements for MMC --->

				#getMainRequirements()#
			
			</cfcase>

		</cfswitch>
	
	</cffunction>


	<!--- I GET THE TOP BAR --->
	<cffunction name = "renderHeader" returntype = "any" access = "private" output = "true" 
				hint = "I get the header of the layout">


			<!-- Topbar
		    ================================================== -->
		    <div class = "topbar">
		      <div class = "topbar-inner">
		        <div class = "container-fluid">
		          <a class = "brand" href = "?action=main.home">Mura Management Console</a>
		          <ul class = "nav">
		            <li class = "active"><a href = "?action=main.home">Home</a></li>
		            <li><a href = "?action=main.newSite">Install New Site</a></li>
		            <li><a href = "?action=main.contact">Contact</a></li>
		          </ul>
		          <p class = "pull-right">Version #mmcVersion#</p>
		        </div>
		      </div>
			    </div>

	</cffunction>

	<!--- I GET THE FOOTER --->
	<cffunction name = "renderFooter" returntype = "any" access = "private" output = "true" 
				hint = "I get the footer of the layout">

			<!-- Footer
		    ================================================== -->
	        <footer>
	          <p>&copy; Jas Panesar</p>
	        </footer>

	</cffunction>


	<!--- I GET THE SIDE BAR CONTENT THAT GOES IN THE LAYOUT --->
	<cffunction name = "renderLayoutSidebar" returntype = "any" access = "private" output = "true" displayname = "getLayoutSideBar" 
				hint = "I return the sidebar layout" >

	  <div class = "sidebar">
        <div class = "well">
          <h5>My Mura Console</h5>
          <ul>
            <!---<li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>--->
          </ul>

          <h5>About</h5>
          <ul>
            <li><a href = "?action=main.license">Requirements</a></li>          
            <li><a href = "?action=main.contact">Contact</a></li>
            <li><a href = "?action=main.license">License</a></li>
          </ul>
        </div>
      </div>
		
	</cffunction>

<!--- LAYOUT FUNCTIONS END --->





<!--- CONTENT FUNCTIONS START --->

	<!--- this is the content that's displayed in each page by the renderContent() function
			which looks up based on action --->


	<cffunction name="getMainContact" returntype="any" output="true" hint="I display contact info in page">
		Contact Jas via www.panesar.net.
	</cffunction>

	<cffunction name="getMainCreateSite" returntype="any" output="true" hint="I display what happened after you try to create a page">
			I am main.CreateSite.  There should be some values that can be outputted when this happened.
	</cffunction>


	<cffunction name = "getMainHome" returntype = "any" 
				hint = "I get the content for main.home">
		
		        <!-- Main hero unit for a primary marketing message or call to action -->
			        <div class = "hero-unit">
			          <h1>Hi, this is an unofficial<br /> Mura Management Console. </h1>
			          <p> 
			   		  	MMC setups a New installation of Mura for you locally.<br/>
			   		  	In the process it creates a repo online, checks it out locally, and then downloads the latest Mura into it.<br />
			   		  	If you need a database setup, it will do that for you.<br />
			   			Eventually, I want it to do everything for me including auto-install Mura and install a plugin for me<br />
			          <!---<p><a class="btn primary large">Learn more &raquo;</a></p>--->
			        </div>

			        <!-- First row of columns -->
			        <div class = "row">
			          <div class = "span6">
			            <h2>What I needed.</h2>
			            <p>I wanted to setup new Mura projects quicker. <br /><br />
			            After building shortcut command line scripts,<br />
			            I slowly realized it would be nice to have some CF commands tied in.<br/><br/>
			            I decided to build this console where I could setup a new site in a few clicks.</p>
			          </div>

			          <div class = "span4">
			            <h2>What this is.</h2>
			            <p>This is a one file console.<br />
			            Nothing to install, configure, or map.<br /><br />
			             Drop it in any folder and click<br />
			             <a href = "?action=main.newSite">Install New Site</a>.<br/><br/></p>
			            <p><a class = "btn primary large" href = "?action=main.newSite">Install new site &raquo;</a></p>
			         </div>

			         <div class = "span6">
			            <h2>What you need.</h2>
			            <p>I've developed this with the following available.<br/>Your help is welcome to confirm other environments.<br/>
			            <ul>
				            <li><a href = "http://www.adobe.com/products/coldfusion-family.html">Adobe ColdFusion 9</a> on Mac OSX 10.6.8</li>
				            <li>Access to the <a href = "http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7d56.html">cfexecute</a> tag</li>
				            <li><a href = "http://curl.haxx.se/">Curl</a> available on the command line</li>
				            <li>If you're creating databases, <a href = "http://www.mysql.com">mysql</a> available from the command line</li>
				        </ul>
          				</p>
			            <p><a class = "btn" href = "?action=main.requirements">View details &raquo;</a></p>
			         </div>	
			          
			        </div>

			        <hr>


	</cffunction>


	<cffunction name="getMainLicense" returntype="any" output="true" 
				hint="I contain the license info">
							I haven't figured out which license I want to release this under yet.  <br /><br />

					Additionally Sean Walsh has contributed / is working on helping getting plugins specifically deploying remotely.  I'll have to sort his contributions out part with him.<br /><br />

					Despite this, if you're one of 4 people in the world looking at this, I want to release it. It's too cool to leave it in the dark.<br />

					Here's my own license so far until I have a chance to familiarize myself with the license I'd like and pick it.<br /><br />
					
					Any issues or questions, please contact me from my blog (<a href = "http://www.panesar.net">http://www.panesar.net</a>) and it will help me along to get this part cleared up a bit more.<br /><br />

					- You can use this at your own peril.  <br />
					- Don't change credit for this project
					- Don't sell this
					- Feel free to learn from this and make it yours
					- If you want to re-distribute contact me for now until I pick a proper license.
					- If you install and try to use this, I am liable to the amount that you paid me for it (nothing).<br /><br />
			
					Lastly, this project is not from Blue River. But I dedicate it to them for making my life easier. ;) <br />
			          (Maybe it will be one day.) <br/> <br />
			          For now it's just about making my life easier, and for anyone else who might benefit from it.<br /><br />

			          Hope you enjoy,<br />
			          Jas</p>
	</cffunction>


	<cffunction name = "getMainNewSite" returntype = "any" output = "true" 
				hint = "I display the create new site screen" >
		
		<h1>Let's create a new site</h1>


			<cfform name = "frmInstallNewSite" action = "?action=main.createSite">
				
			<!---	<cfoutput>#cgi.HTTP_USER_AGENT#<br/>
				[#gitPath#]<br/>


		[[<cfexecute 
			name = "which"
			arguments = "-a git"
			timeout = "30" />]]



				</cfoutput>--->

			        <!-- First row of columns -->
			        <div class = "row">
			          <div class = "span6">
			            <h3>What's it called?</h3>
			            <p>First we need to name our project folder.<br />
			            Pick a nice name. NoSpaces.</p>

			            <div class = "clearfix">
							<label for = "projectName">Project Name:</label>
							<div class = "input">
								<cfinput class = "xlarge" id = "projectName" name = "projectName" size = "30" type = "text" />
							</div>
						</div><!-- /clearfix -->

						<h3>Where should I create the repo?</h3>
						<p>So far Bitbucket is supported, GitHub coming.</p>
			            <p>You will need to enter the full path to your Git executable in order to check out the repository. To locate it, either enter "which git"(Linux) or "where git"(Windows) at the terminal or command line.</p>

			            <div class = "clearfix">
			            	<label>Repository Location?</label>
			            	<div class = "input">
			            		<ul class = "inputs-list">
			            			<li>
			            				<label>
				            				<cfinput id = "bitbucket" name = "dcvs" value = "bitbucket" type = "radio" checked = "yes" />
						            		<span>Bitbucket</span>
					            		</label>
					            	</li>
					            	<li>	
					            		<label>
				            				<cfinput id = "github" name = "dcvs" value = "github" type = "radio" />
						            		<span>GitHub</span>
					            		</label>
					            	</li>
					            </ul>
			            	</div>
			            </div>
			            <div class = "clearfix">
				            <label for = "gitPath">Full Path to Git:</label>
				            <div class = "input">
				            	<cfinput class = "xlarge" id = "gitPath" name = "gitPath" size = "30" type = "text"  value = "git" />
			            	</div>
			            </div>
			            <div class = "clearfix">
			            	<label for = "userName">Username:</label>
			            	<div class = "input">
			            		<cfinput class = "xlarge" id = "userName" name = "userName" size = "30" type = "text" />
			            	</div>
			            </div>
			            <div class = "clearfix">
			            	<label for = "password">Password:</label>
			            	<div class = "input">
			            		<cfinput class = "xlarge" id = "password" name = "password" size = "30" type = "password" />
			            	</div>
			            </div>

			            
			            <cfinput name = "btnSubmit" id = "btnSubmit" type = "submit" class = "btn primary xlarg" value = "Install New Site" />

   						 <!--- hide away pretty button <p><a class = "btn primary large"  href = "?action=main.newSite">Install new site &raquo;</a></p> --->

			          </div>



	        </cfform>
			          
			        </div>

	</cffunction>


	<cffunction name = "getMainRequirements" returntype = "any" output = "true" 
				hint = "I display the requirements">
							Requirements will go here.  For now I've listed them on the front page
	</cffunction>

<!--- CONTENT FUNCTIONS END --->


<!--- CONSOLE FUNCTIONS START --->


	<!--- CREATE BITBUCKET REPO FUNCTIONS START --->
	<cffunction name = "createRepo"  returntype = "any"  output = "false"
				hint = "I create a repo in bitbucket or github">

				<cfargument 	name = "folderName" 	type = "string" 	required = "true" 
								hint = "What the repo should be called and the folder that it'll be checked out locally into" />		
				<cfargument 	name = "installPath"	type = "string"		required = "true"
								hint = "The full path to the project folder so that we can check it out" />
				
				<cfargument 	name = "repoUsername" 	type = "string" 	required = "true" 
								hint = "Login name for DVCS" />

				<cfargument 	name = "repoPassword" 	type = "string" 	required = "true" 
								hint = "Password for DVCS" />

				<cfargument 	name = "checkOutRepo" 	type = "boolean" 	required = "true" 	default = "true" 
								hint = "Should we do a git clone locally?" />

				<cfargument 	name = "dcvsType"		type = "string"		required = "true"
								hint = "Bitbucket or GitHub?" />

				<cfargument 	name = "gitPath"		type = "string"		required = "true"
								hint = "The path to Git so that we can clone this bad boy" />

				<!--- This should break out into separate functions... --->
				<cfif arguments.dcvsType EQ 'bitbucket'>
					<cfhttp
						url = "https://api.bitbucket.org/1.0/repositories/"
						method = "POST"
						username = "#arguments.repoUsername#"
						password = "#arguments.repoPassword#"
						throwOnError = "yes">
						<cfhttpparam
							name = "name"
							value = "#arguments.folderName#"
							type = "formField"
							encoded = "no"  />
						<cfhttpparam
							name = "scm"
							value = "git"
							type = "formField"
							encoded = "no"  />
						<cfhttpparam
							name = "is_private"
							value = "true"
							type = "formField"
							encoded = "no" />
					</cfhttp>

					<cfif arguments.checkOutRepo>
						<!--- Shorten the arguments string a little.. --->
						<cfset user = arguments.repoUsername />
						<cfset pass = arguments.repoPassword / >
						<!--- Has to be lowercase or Git won't check it out successfully --->
						<cfset project = lcase( arguments.folderName ) />
						<cfset directory = arguments.installPath />
						<cfexecute
							name = "#arguments.gitPath#"
							arguments = "clone https://#user#:#pass#@bitbucket.org/#user#/#project#.git #directory#"
							timeout = "60" />
							<!--- Timeout may need tweaking, but it HAS to be set to long enough to allow the command 
							to execute. If not, the install process will continue before the directory has been created 
							and it's game over man, game over. --->
					</cfif>
				</cfif>
				<!--- This isn't working right now...GitHub makes you init the repo locally and then push to it. --->
				<cfif arguments.dcvsType EQ 'github'>
					<cfset githubArgs = {} />
					<cfset githubArgs['name'] = "#arguments.folderName#" />
					<cfset githubArgs = serializeJSON( githubArgs ) />

					<cfhttp
						url = "https://api.github.com/user/repos"
						method = "post"
						username = "#arguments.repoUsername#"
						password = "#arguments.repoPassword#"
						throwOnError = "yes">
						<cfhttpparam
							name = "Content-Type"
							value = "application/json"
							type = "header" />
						<cfhttpparam
							value = "#githubArgs#"
							type = "body" />
					</cfhttp>

					<cfif arguments.checkOutRepo>
						<!--- Shorten the arguments string a little.. --->
						<cfset user = arguments.repoUsername />
						<cfset pass = arguments.repoPassword / >
						<!--- Has to be lowercase or Git won't check it out successfully --->
						<cfset project = lcase( arguments.folderName ) />
						<cfset directory = arguments.installPath />
						<cfexecute
							name = "#arguments.gitPath#"
							arguments = "clone https://#user#:#pass#@github.com/#user#/#project#.git #directory#"
							timeout = "60" />
							<!--- Timeout may need tweaking, but it HAS to be set to long enough to allow the command 
							to execute. If not, the install process will continue before the directory has been created 
							and it's game over man, game over. --->
					</cfif>
				</cfif>


	</cffunction>

	<cffunction name = "getGitLocation"  returntype = "any"  output = "false"
				hint = "I return the location of git locally">

				<cfargument 	name = "userAgent" 	type = "string" 	required = "true"  default = "#cgi.HTTP_USER_AGENT#"
								hint = "The User agent" />		

		<cfif 		findNoCase( "Windows" , arguments.userAgent ) GT 0>
			<cfset gitSearchCommand = "where" />
		<cfelseif 	findNoCase( "Macintosh" , arguments.userAgent ) GT 0>
			<cfset gitSearchCommand = "which" />
		<cfelseif 	findNoCase( "Linux", arguments.userAgent ) GT 0>
			<cfset gitSearchCommand = "which" />
		</cfif>
	
		<cfexecute 
			name = "#gitSearchCommand#"
			arguments = "git"
			variable = "returnedGitPath"
			timeout = "30" />

		<cfif len( returnedGitPath ) LT 1>
			<cfset returnedGitPath = "blank returned!" />
		</cfif>

		<cfreturn returnedGitPath />
		
	</cffunction>



	<!--- CREATE BITBUCKET REPO FUNCTIONS END --->


	<!--- CREATE DATABASE FUNCTIONS START --->

	<cffunction name = "createDB" 	returntype = "any" 	output = "true" 
				hint = "I create a mySQL db" >
		
				<cfargument name = "dbName" 	type = "string" 	required = "true" 
							hint = "Name of database to create" />

				<cfargument name = "dbusername" type = "string" 	required = "true" 
							hint = "username to create in DB" />
				
				<cfargument name = "dbpassword" type = "string" 	required = "true" 
							hint = "password to create in DB" />					
		


		<!--- my proof of concept bash script to convert 

		EXPECTED_ARGS=3
		E_BADARGS=65
		#MYSQL=`which mysql`
		MYSQL = '/usr/local/mysql/bin/mysql'

		Q1="CREATE DATABASE IF NOT EXISTS $1;"
		Q2="GRANT ALL ON *.* TO '$2'@'localhost' IDENTIFIED BY '$3';"
		Q3="FLUSH PRIVILEGES;"
		SQL="${Q1}${Q2}${Q3}"

		if [ $# -ne $EXPECTED_ARGS ]
		then
		  echo "Usage: $0 dbname dbuser dbpass"
		  exit $E_BADARGS
		fi

		#$MYSQL -uroot -p -e "$SQL"
		# path needs to be set manually in this file because I haven't figured out bash scripting syntax that works yet.
		/usr/local/mysql/bin/mysql -uroot -p -e "$SQL"


		--->

	</cffunction>

	<cffunction name = "createDSN" 	returntype = "any" 	output = "true" 
				hint = "I create a ColdFusion DSN" >
		
				<cfargument name = "dsnName" 	type = "string" 		required = "true" 
							hint = "Name of dsn to create" />

				<cfargument name = "adminUsername" 	type = "string" 	required = "true"	default = "admin" 
							hint = "The admin user name you log into CF Admin with, default is admin" />	
							
				<cfargument name = "adminPassword" 	type = "string" 	required = "true" 
							hint = "Cf administrator password" />													

				<!--- logic to create admin DSN goes here --->

	</cffunction>



	<!--- CREATE DATABASE FUNCTIONS END --->




	<!--- INSTALL MURA FUNCTIONS START --->

	<cffunction name = "installMura" returntype = "any" output = "false" 
				hint = "I download and extract the latest version of Mura to a user-specified directory">

		<cfset var fullInstallPath = '' />
		<cfset var zipFile = '' />

		<cfif not isDefined( 'form.projectName' )>
			<cflocation url = "mmc.cfm?action=main.newSite" addtoken = "false" />
		</cfif>

		<cfset fullInstallPath = expandPath( '.' ) & '/' & form.projectName />

		<cfset createRepo( form.projectName, fullInstallPath, form.username, form.password, true, form.dcvs, form.gitPath ) />
		<cfset zipFile = downloadMura( fullInstallPath ) />
		<cfset extractMura( zipFile, fullInstallPath ) />

		<cffile action = "delete" file = "#zipFile#" />

	</cffunction>

	<cffunction name = "downloadMura" returntype = "any" output = "false" 
				hint = "I download the latest version of Mura">
		<cfargument name = "installDir" required = "true" type = "string" />

		<cfhttp
			url 		= "http://www.getmura.com/index.cfm/?LinkServID=62611A40-FAD0-94F4-54E16A8FC4614BD2&showMeta=0"
			method		= "GET"
			path 		= "#arguments.installDir#"
			file 		= "mura-latest.zip"
			getAsBinary	= "yes" />
		
		<cfreturn installDir & '/mura-latest.zip' />

	</cffunction>

	<cffunction name = "extractMura" returntype = "any" output = "false" 
				hint = "I extract the Mura zip">
		<cfargument name = "zipFile" required = "true" type = "string" />
		<cfargument name = "installDir" required = "true" type = "string" />

		<cfzip
			action 		= "unzip"
			destination	= "#arguments.installDir#"
			file 		= "#arguments.zipFile#" />

		<!--- TODO: need to delete the .zip file after extracting complete --->

	</cffunction>

	<!--- INSTALL MURA FUNCTIONS END --->

<!--- CONSOLE FUNCTIONS END --->



<!--- SOURCE FILES START --->

	<cffunction name = "getBootstrap" returntype = "any" output = "false" 
				hint = "I return the latest Bootstrap.css to include in the page">

		<!--- Not tied in yet -- The latest version of this file can be downloaded from
				https://github.com/twitter/bootstrap/blob/master/bootstrap.css

				Twitter Bootstrap Version 1.3.0

				I am not using the minified version so it's easy to debug / extend the styles as needed. --->

		<cfsavecontent variable = "strBootstrap" >
			
			<!--- this is where I might think about including an offline copy of twitter bootstrap --->		
			
		</cfsavecontent>

		<!--- when we're including it in the .cfm file we have to make sure all the color values in the CSS are double hashed so CF processes them correctly 
				Not an issue if the CSS was linked in.

		<cfset strBootstrap = replace( #strBootstrap#, "#" , "##" , "ALL" ) /> --->

		<cfreturn strBootstrap />

	</cffunction>

