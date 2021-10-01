<?php 
/**
* @copyright	Copyright (C) 2011 Simplify Your Web, Inc. All rights reserved.
* @license		GNU General Public License version 3 or later; see LICENSE.txt
*/

// Explicitly declare the type of content
header("Content-type: text/css; charset=UTF-8");
    
// Grab module id from the request
$suffix = $_GET['suffix']; 
?>

.latestnewsenhanced_<?php echo $suffix; ?>.newslist {	
}

	.latestnewsenhanced_<?php echo $suffix; ?> .onecatlink {
		margin-top: 20px;
	}

	.latestnewsenhanced_<?php echo $suffix; ?> .news {
		overflow: hidden;
		margin-top: 10px;
	}
	
	.latestnewsenhanced_<?php echo $suffix; ?> .news:first-child {
		margin-top: 0;
	}
	
		.latestnewsenhanced_<?php echo $suffix; ?> .innernews {
			overflow: hidden;
			padding: 10px 12px;
		}
	
		.latestnewsenhanced_<?php echo $suffix; ?> .even {
			/*background-color: #F4F4F4;*/
		}
		
			.latestnewsenhanced_<?php echo $suffix; ?> .newshead {		
				/* same column height fix */
				margin-bottom: -1000px;
				padding-bottom: 1000px;		
			}
			
			.latestnewsenhanced_<?php echo $suffix; ?> .headleft {
				float: left;
			}
			
			.latestnewsenhanced_<?php echo $suffix; ?> .headright {
				float: right;
			}
			
			.latestnewsenhanced_<?php echo $suffix; ?> .headnone {
				display: none;
			}
			
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar {
				}	
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar.noimage {			
					background: #F4F4F4; /* Old browsers */
					background: -moz-linear-gradient(top, #ffffff 0%, #e5e5e5 100%); /* FF3.6+ */
					background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#e5e5e5)); /* Chrome,Safari4+ */
					background: -webkit-linear-gradient(top, #ffffff 0%,#e5e5e5 100%); /* Chrome10+,Safari5.1+ */
					background: -o-linear-gradient(top, #ffffff 0%,#e5e5e5 100%); /* Opera11.10+ */
					background: -ms-linear-gradient(top, #ffffff 0%,#e5e5e5 100%); /* IE10+ */
					filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e5e5e5',GradientType=0 ); /* IE6-9 */
					background: linear-gradient(top, #ffffff 0%,#e5e5e5 100%); /* W3C */
					color: #3D3D3D;						
					border-top-right-radius: 4px;
					border-top-left-radius: 4px;
				}		
	
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .weekday, 
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .month, 
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .day, 
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .year {
						position: relative;
						width: 100%;
						text-align: center;
					}
					
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar.noimage .weekday {							
						background: #C8C8C8; /* Old browsers */
						background: -moz-linear-gradient(top, #eeeeee 0%, #cccccc 100%); /* FF3.6+ */
						background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eeeeee), color-stop(100%,#cccccc)); /* Chrome,Safari4+ */
						background: -webkit-linear-gradient(top, #eeeeee 0%,#cccccc 100%); /* Chrome10+,Safari5.1+ */
						background: -o-linear-gradient(top, #eeeeee 0%,#cccccc 100%); /* Opera11.10+ */
						background: -ms-linear-gradient(top, #eeeeee 0%,#cccccc 100%); /* IE10+ */
						filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#cccccc',GradientType=0 ); /* IE6-9 */
						background: linear-gradient(top, #eeeeee 0%,#cccccc 100%); /* W3C */						
						color: #494949;						
						border-top-right-radius: 4px;
						border-top-left-radius: 4px;
					}
			
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .weekday {
						text-transform: uppercase;
						letter-spacing: 0.4em;
					}
					
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .month {
						font-size: 0.8em;
						font-weight: bold;
						letter-spacing: 0.45em;
					}
					
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .day {	
						font-size: 1.8em;
						font-weight: bold;
						letter-spacing: 0.1em;
					}
					
					.latestnewsenhanced_<?php echo $suffix; ?> .newshead .calendar .year {
						font-size: 0.7em;
						letter-spacing: 0.35em;
						min-height: 4px;
					}			

				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .picture {
	    			overflow: hidden;
					background-color: #FFFFFF;
					border: 1px solid #CCCCCC;
					padding: 3px;
					text-align: center;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .picture a,
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .nopicture a {
					text-decoration: none;
					display: inline-block;
					height: 100%;
    				width: 100%;
    				cursor: hand;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .picture a:hover,
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .nopicture a:hover {
					text-decoration: none;
				}
	
				.latestnewsenhanced_<?php echo $suffix; ?>  .newshead .picture img {
					max-width: 100%;
					max-height: 100%;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .picture .defaultpicture {
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .nopicture {
	    			overflow: hidden;
					background-color: #FFFFFF;
					border: 1px solid #CCCCCC;
					padding: 3px;
					text-align: center;
				}
	
				.latestnewsenhanced_<?php echo $suffix; ?> .newshead .nopicture span {
					background-color: #F4F4F4;
					display: inline-block;
					width: 100%;
					height: 100%;
				}

			.latestnewsenhanced_<?php echo $suffix; ?> .newsinfo {
			}			
			
			.latestnewsenhanced_<?php echo $suffix; ?> .infoleft {
				clear: right;
			}
			
			.latestnewsenhanced_<?php echo $suffix; ?> .inforight {
				clear: left;
			}
			
				.latestnewsenhanced_<?php echo $suffix; ?> .newstitle {
					font-weight: bold;
                    font-size: 12px;
                    line-height: 21px;
                    height:36px;
                    width: 250px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newsintro {
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .newsextra {
					font-size: 0.8em;
				}
				
                .latestnewsenhanced_<?php echo $suffix; ?> .newsextra .newsdate{
					font-size: 12px;
                    float: left;
                    margin-right: 5px;
                    color: #fff;
                    padding: 2px 5px;
                    background: #006699;
                    -moz-border-radius: 4px; /* Firefox */
  					-webkit-border-radius: 4px; /* Safari and Chrome */
  					border-radius: 4px; /* Opera 10.5+, future browsers, and now also Internet Explorer 6+ using IE-CSS3 */
				}			
            
				.latestnewsenhanced_<?php echo $suffix; ?> .infoleft .newstitle {
					margin: 0 0 0 20px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .infoleft .newsintro {
					margin: 0 0 0 20px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .infoleft .newsextra {
					margin: 0 0 0 20px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .infoleft .link {
					margin: 0 0 0 20px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .infoleft .catlink {
					margin: 0 0 0 20px;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .inforight .newstitle {
					margin: 0 20px 0 0;
					text-align: right;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .inforight .newsintro {
					margin: 0 20px 0 0;
					text-align: right;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .inforight .newsextra {
					margin: 0 20px 0 0;
					text-align: right;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .inforight .link {
					margin: 0 20px 0 0;
					text-align: right;
				}
				
				.latestnewsenhanced_<?php echo $suffix; ?> .inforight .catlink {
					margin: 0 20px 0 0;
					text-align: right;
				}
