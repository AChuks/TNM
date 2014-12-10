(function(GLOBAL, $){
	// $ maps to JQuery objects
	
	var ns, _ops, vidArr, pages, manual,
		//jq objects
		win, content, container, title, screens, screen_top, iframe, description, gallery, thumbs, search_info;
	
		
	ns = "vimeo";
	//default options passed 
	_ops = {
		resource : 'channel', 
		id : 'vimeohq'
	}
	
	/*
	@resource & id options set with $.vimeo.init({ 
	resource : 'channel', 
	id : <place id like 23432423 or named channel/album here>
	});
	*/
	
	vidArr = [];
	pages = 1;
	manual = false;

	
	
	// _init is a private function. Can only be called on a public function.
	function _init(){
		win = $(window);
		content = $("#content");
		container = content.find('#video-container');
		title = container.find("#title");
		description = container.find("#description");
		screens = container.find("#screen");
		screen_top = container.offset().top;
		iframe = screens.find("iframe");
		gallery = content.find("#gallery");
		thumbs = gallery.find("#thumbs");
		searchInfo = content.find("#search-info");
		
	
		sizeScreen();
		//hide the container
		//container.addClass("hidden");
		getVideos();	
	} // _Init
	
	
	
	
	// init is a public function. 
	function init(ops){
		ops = ops || {};
		$.extend(_ops, ops);
		_init();
		win.resize(sizeScreen).bind('hashchange',controller);
		thumbs.delegate("form","submit",updateVidInfo);
		ipad();
		search();
	} // init
	
	
	
	
	
	function ipad(){
		var userAgent = navigator.userAgent.toLowerCase();
		if(/ipad/.test(userAgent)){
			gallery.addClass('ipad');
		}
	} // ipad
	
	
	
	
	
	function sizeScreen(){
		var contentWidth = container.width() - 10;
		screens.css({
			height : (contentWidth / 1.777)
		});
	} // sizeScreen

	
	
	function createVideos(filtered_data, id){
		var hash, html;
		
		html = "";
		data = (filtered_data || vidArr).slice().reverse();
		
		l = data.length;
			
		_.templateSettings = {
			interpolate : /\{\{=(.+?)\}\}/g,
			escape : /\{\{-(.+?)\}\}/g,
			evaluate: /\{\{(.+?)\}\}/g,
		};
			
		while(l--){
			var template = $("#thumb_tmpl").html();
			var compiled = _.template(template);
			
			html += compiled(data[l]);

			//	html += tmpl("thumb_tmpl",{data[l]);
			} 
			
			var template2 = $("#no_videos_tmpl").html();
			var compiled2 = _.template(template2)
			html = html ||  compiled2(template2, {});
			
			
			//	html = html || tmpl("no_videos_tmpl", {});
		
			thumbs.html(html);
		
			if(filtered_data){
				return container.addClass("hidden");
			}
		
			if(id){
				return thumbs.find("#"+id).trigger("submit");
			}
		
			//otherwise click on the first video
			return thumbs.find('form').eq(0).trigger("submit");
	
		} // Create Videos
	
	
	
		function controller(){

			var hash, paths;
		
			if(manual){
				return false;
			}
		
			hash = (this.location.hash.replace("#", "")).replace(/\+/g, " ");
			hash = decodeURIComponent(hash);
		

		
			//(/\/search\/\w+/g).test(hash);
			paths = hash.split("/search/"); 
		
			if(paths[1]){
				return filter(paths[1]);
			}
		
			toggleSearchString();
			//test whether or not this is an id
			if( (/\d+/g).test(paths[0]) ){
				return createVideos(false, paths[0]);
			}
	
			return createVideos();
		} // Controller
	
	
	
	
		function validateResources(){
			if(!_ops.resource || !_ops.id){
				return $.error("resource or id is missing!");
			}
		} // ValidateResources
	
	
		function getVideos(){
			var url, _url;
			url = "http://vimeo.com/api/v2/"+_ops.resource+"/"+_ops.id+"/videos.json?callback=?";
			if(pages > 3){
				return controller.call(GLOBAL);
			}
		
			_url = url + "&page="+pages;	
			$.getJSON(_url, function(data){
			
				vidArr = vidArr.concat(data);
				pages++;
				getVideos();
			});
		} //GetVideos
	
	
	
		function updateVidInfo(){
			var vidObj, id;
		
			id = this.id;
			//todo use filter instead? But IE doesn't support filter
			vidObj = $.grep(vidArr,function(n){
				return (n["id"] === (1 * id) );
			});
		
			vidObj = vidObj[0] || vidArr[0];
			manual = true;
			window.location.hash = id;
			setTimeout(function(){
				manual = false;	
			}, 500);
		
			title.html(vidObj["title"]);
			description.html(vidObj["description"]);
			container.removeClass("hidden");
			sizeScreen();
			window.scrollTo(0, screen_top - 60 );	
			return true;
		} // UpdatVidInfo
	
	
	
	
		function filter(val){
	
			var data;
			val = val.toLowerCase();		
			data = vidArr.slice();
			data = $.grep(data, function(n){
				return [n.tags, n.title, n.description].join(" ").toLowerCase().indexOf(val) !== -1;
			});
			
			toggleSearchString(val);
			return createVideos(data);
		} // Filter
	
	
		function toggleSearchString(val){
			var _val, action;
		
			_val = val || "";
			action = _val ? "remove" : "add";
			return searchInfo[action+"Class"]('hidden').find("#search-string").text(_val);
	
		} // ToggleSearchString
	
	
	
		function search(){
			var _search, go;
		
			_search = $("#search");
			go = function(){
				var val = _search.val();
				if(val){
					location.hash = "/search/"+val;
					return true;
				}
			}; // Go
		
			_search
			.bind("keydown", function(e){
				if(e.which !== 13){
					return true;
				}
				e.preventDefault();
				e.stopPropagation();
			
				return go();
			}) // Bind
		
			$("#search-button").click(go);
		
		} // Search
	
	
	
		//export
		$[ns] = {
			init : init
		}; //ns
	
	
	})(window, window.jQuery); // End Global






