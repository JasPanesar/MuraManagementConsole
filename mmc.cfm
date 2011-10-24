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
	<cfparam name="url.action" default="main.home" />


<!--- HTML RENDERER START --->
<!--- HTML RENDERER RENDERS EVERY SCREEN --->


	<!DOCTYPE html>
	<html lang="en">
	  <head>
	    <meta charset="utf-8">

     	<title>Mura Management Console - Jas Panesar</title>		


     	<!--- STYLING START --->

	   	<!--- Call to the function
	   	<script type = "text/javascript">
	   		<cfoutput>#getBootstrap()#</cfoutput>
	   	</script> --->

	   	<link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css">
		<style type="text/css">
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

			 <div class="container-fluid">

			 	<!--- render the sidebar --->
			 	#renderLayoutSidebar()#

			      <div class="content">

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

	<cffunction name="renderContent" returntype="any" output="true" displayname="getContent" hint="I get the content for any page" description="I am the mega switch between all the page that finds all the content and commands and does it all.">

		<cfargument name="action" type="string" required="true" displayname="the action that we're rendering" hint="" />


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

				#getMainNewSite()#
				
			</cfcase>


			<cfcase  value = "main.requirements">
				<!--- I display the requirements for MMC --->

				#getMainRequirements()#
			
			</cfcase>

		</cfswitch>
	
	</cffunction>


	<!--- I GET THE TOP BAR --->
	<cffunction name="renderHeader" returntype="any" access="private" output="true" hint="I get the header of the layout">


			<!-- Topbar
		    ================================================== -->
		    <div class="topbar">
		      <div class="topbar-inner">
		        <div class="container-fluid">
		          <a class="brand" href="?action=main.home">Mura Management Console</a>
		          <ul class="nav">
		            <li class="active"><a href="?action=main.home">Home</a></li>
		            <li><a href="?action=main.newSite">Install New Site</a></li>
		            <li><a href="?action=main.contact">Contact</a></li>
		          </ul>
		          <p class="pull-right">Version #mmcVersion#</p>
		        </div>
		      </div>
			    </div>

	</cffunction>

	<!--- I GET THE FOOTER --->
	<cffunction name="renderFooter" returntype="any" access="private" output="true" hint="I get the footer of the layout">

			<!-- Footer
		    ================================================== -->
	        <footer>
	          <p>&copy; Jas Panesar</p>
	        </footer>

	</cffunction>


	<!--- I GET THE SIDE BAR CONTENT THAT GOES IN THE LAYOUT --->
	<cffunction name="renderLayoutSidebar" returntype="any" access="private" output="true" displayname="getLayoutSideBar" 
				hint="I return the sidebar layout" description="I render the sidebar layout links">

	  <div class="sidebar">
        <div class="well">
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
				
			

			        <!-- First row of columns -->
			        <div class = "row">
			          <div class = "span6">
			            <h3>What's it called?</h3>
			            <p>First we need to name our project folder.<br />
			            Pick a nice name. NoSpaces.</p>

			            <div class = "clearfix">
							<label for = "xlInput">Project Name:</label>
							<div class = "input">
								<cfinput class = "xlarge" id = "projectName" name = "projectName" size = "30" type = "text" />
							</div>
						</div><!-- /clearfix -->

						<h3>Where should I create the repo?</h3>
			            <p>So far Bitbucket is supported, GitHub coming.</p>

			            
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

	<cffunction name = "installMura" returntype = "any" output = "false" 
				hint = "I download and extract the latest version of Mura to a user-specified directory">

		<cfset var fullInstallPath = '' />
		<cfset var zipFile = '' />

		<cfif not isDefined( 'form.projectName' )>
			<cflocation url = "mmc.cfm?action=main.newSite" addtoken = "false" />
		</cfif>

		<cfset fullInstallPath = expandPath( '.' ) & '/' & form.projectName />

		<cfset createMuraInstallDirectory( fullInstallPath ) />
		<cfset zipFile = downloadMura( fullInstallPath ) />
		<cfset extractMura( zipFile, fullInstallPath ) />

		<cffile action = "delete" file = "#zipFile#" />

	</cffunction>

	<cffunction name = "createMuraInstallDirectory" returntype = "any" output = "false" 
				hint = "I create the new directory">
		<cfargument name = "installDir" required = "true" type = "string" />

			<cfdirectory action = "create" directory = "#arguments.installDir#" mode = "777" />

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

	</cffunction>

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

