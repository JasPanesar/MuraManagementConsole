<!--- MMC.CFM 

	I AM THE ONE FILE, MAGICAL, MEGA MURA MANAGEMENT CONSOLE.  Of course I should be a nicely organized folder based app, but I like being dropped in anywhere and just working.

	--->



	<!--- PRE AMBLE:  This file is setup as a switch that renders the screens that are needed.  As a result it's pretty long.   Did my best to set things up as functions so I can break it up or grow it one day if it's needed.  Until then, this should work

		SECTIONS OF THIS FILE:

		HTML RENDERER - Renders each screen

		LAYOUT FUNCTIONS --> Provides 

	--->


<!--- MMC SETUP --->
	<cfset mmcVersion = "0.01">

	<!--- make sure there's a url.action somewhere --->
	<cfif isDefined ( "url.action" )>
		<!--- do nothing because we have an action --->
	<cfelse>
		<!--- we don't have a url action --->
		<cfset url.action = "main.home" />
	</cfif>


<!--- HTML RENDERER START --->
<!--- my job is to render a screen --->


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
				
			        <!-- Main hero unit for a primary marketing message or call to action -->
			        <div class="hero-unit">
			          <h1>Hi. </h1>
			          <p>This is my unofficial Mura Management Console.  <br/>

			   
			          It's not related to Blue River. But I dedicate it to them for making my life easier. Maybe it will be one day. <br/> 
			          For now it's just about making developers (my) life easier.</p>
			          <!---<p><a class="btn primary large">Learn more &raquo;</a></p>--->
			        </div>

			        <!-- Example row of columns -->
			        <div class="row">
			          <div class="span5">
			            <h2>What I needed.</h2>
			            <p>I want to use Mura for my litle projects.  But getting a plugin or a new site deployed can take a bit of time.  A bit of time I end up not taking</p>
			            <p><a class="btn medium" href="##">View details &raquo;</a></p>
			          </div>
			          <div class="span6">
			            <h2>What this is.</h2>
			             <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
			            <p><a class="btn primary large" href="##">View details &raquo;</a></p>
			         </div>
			          <div class="span5">
			            <h2>How it works.</h2>
			             <p>This started as a series of command line script files that did everything for me.  As I kept adding I slowly realized it would be nice to have some CF  </p>
			            <p><a class="btn" href="##">View details &raquo;</a></p>
			         </div>			         
			        </div>

			        <hr>


			</cfcase>

			<cfcase  value = "main.contact">
				I am main.contact
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


	<!--- I GET THE SIDE BAR CONTENT THAT GOES IN THE LAYOUT --->
	<cffunction name="renderLayoutSidebar" returntype="any" access="private" output="true" displayname="getLayoutSideBar" 
				hint="I return the sidebar layout" description="I render the sidebar layout links">

	  <div class="sidebar">
        <div class="well">
          <h5>Create new Site</h5>
          <ul>
            <li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>
            <li><a href = "##" >Link</a></li>
          </ul>
          <h5>Sidebar</h5>

          <h5>About</h5>
          <ul>
            <li><a href = "?action=main.contact">Contact</a></li>
          </ul>
        </div>
      </div>
		
	</cffunction>





<!--- LAYOUT FUNCTIONS END --->






<!--- SOURCE FILES START --->

	<cffunction name = "getBootstrap" returntype = "any" output = "false" 
			hint = "I return the latest Bootstrap.css to include in the page" description = "I return the latest Bootstrap.css to include in the page">

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