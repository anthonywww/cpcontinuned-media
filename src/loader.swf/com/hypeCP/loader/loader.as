class com.hypeCP.loader.loader {
	var cacheVersion;
	var PLUGIN_HOLDER;
	var CLIENT;
	var onEnterFrame;
	var PLUGINS = new Array();
	var HOST = "servers.cpcontinued.com";
	var PENGUIN = "Not found yet";
	var REPLACES = new Array();
	var FAKE_LANG = {};
	var HANDLERS = {};
	var SHAREVARS = {};
	var HANDLERVARS = {};
	var AUTHOR = "";
	var VERSION = "";

	function loader(cacheVersion) {
		this.HANDLERS.SHELL = {};
		this.HANDLERS.AIRTOWER = {};
		this.HANDLERS.LOCAL_CRUMBS = {};
		this.HANDLERS.GLOBAL_CRUMBS = {};
		this.HANDLERS.ENGINE = {};
		this.HANDLERS.INTERFACE = {};
		
		this._addReplace(function(url) {
			return url;
		});

		trace(cacheVersion);
		this.cacheVersion = cacheVersion;
		
		_global.baseURL = "https://media1.cpcontinued.com/";
		System.security.allowDomain("*");
		
		loadMovieNum("https://media1.cpcontinued.com/v2/client/load.swf?cp1356",1,"GET");

		_root.onEnterFrame = function() {
			for(var _loc2_ in _level1) {
				if (typeof _level1[_loc2_] == "movieclip") {
					_level1.bootLoader.messageFromAS3({type:"setEnvironmentData",data: {
						clientPath: "https://media1.cpcontinued.com/v2/client/",
						contentPath: "https://media1.cpcontinued.com/v2/content/",
						gamesPath: "https://media1.cpcontinued.com/v2/games/",
						connectionID: "hype127",
						language: "en",
						basePath: "",
						affiliateID: "0"
					}});
					_root.onEnterFrame = function() {
						if(_level1.shellContainer.DEPENDENCIES_FILENAME) {
							_level1.shellContainer.DEPENDENCIES_FILENAME = "dependencies.json?cpc=" + this.cacheVersion;
							_level1.bootLoader.messageFromAS3({type:"showLogin"});
							_level0.CLIENT.handleContainerFound(_level0.CLIENT.PENGUIN = _level1.shellContainer);
						}
					};
				}
			}
		};
	}

	function handlePluginLoaded(pluginFunction, inter) {
		if (this.PENGUIN.AIRTOWER && (!inter || this.PENGUIN.INTERFACE)) {
			pluginFunction();
		} else {
			this.PLUGINS.push([pluginFunction,inter]);
		}
	}

	function handleContainerFound(container) {
		this.PLUGIN_HOLDER = this.PENGUIN.createEmptyMovieClip("pluginContainer_mc",65535);
		_global.PenguBackup = container;
		var a = 0;
		with(container) {
			if (LOCAL_CRUMBS) {
				_level0.CLIENT._fireEvent("LOCAL_CRUMBS");
			}
			
			if (GLOBAL_CRUMBS) {
				_level0.CLIENT._fireEvent("GLOBAL_CRUMBS");
			}
			
			if (AIRTOWER) {
				_level0.CLIENT._fireEvent("AIRTOWER");
			}

			if (SHELL) {
				a++;
				SHELL.DEPENDENCIES_FILENAME = "dependencies.json?cpc=" + this.cacheVersion;
				SHELL.NEWSPAPER_CRUMBS_FILE = "news_crumbs.swf?cpc=" + this.cacheVersion;
				SHELL.GLOBAL_CRUMBS_FILE = "global_crumbs.swf?cpc=" + this.cacheVersion;
				SHELL.LOCAL_CRUMBS_FILE = "local_crumbs.swf?cpc=" + this.cacheVersion;
				SHELL.START_SCREEN_XML = "login/startscreen.xml?cpc=" + this.cacheVersion;
				_level0.CLIENT._fireEvent("SHELL");
				if (a == 1) {
					SHELL.setWebService({url:"https://cpcontinued.com/"});
				}
			}

			if(LOCAL_CRUMBS) {
				return undefined;
			}

			for (var _loc5_ in this.FAKE_LANG) {
				LOCAL_CRUMBS.lang[_loc5_] = this.FAKE_LANG[_loc5_];
			}

			if (!GLOBAL_CRUMBS || !AIRTOWER || !SHELL) {
				return undefined;
			}
			
			createEmptyMovieClip("addons_mc", _level1.getNextHighestDepth());

			SHELL.analytics = false;
			GLOBAL_CRUMBS.login_server.ip = [this.HOST];
			GLOBAL_CRUMBS.login_server.even_port = 6110;
			GLOBAL_CRUMBS.login_server.odd_port = 6110;
			GLOBAL_CRUMBS.redemption_server.ip = this.HOST;
			GLOBAL_CRUMBS.redemption_server.port = 9875;
			AIRTOWER.LOGIN_IP = this.HOST;
			AIRTOWER.LOGIN_PORT_EVEN = 6110;
			AIRTOWER.LOGIN_PORT_ODD = 6110;
			AIRTOWER.SET_SIZE = "ssp";
			AIRTOWER.SET_ALPHA = "ssa";
			AIRTOWER.SET_BLEND = "ssb";
			AIRTOWER.PLUGIN_LOAD = "pl";
			AIRTOWER.SERVER_DATA = "sd";
			AIRTOWER.GET_VERSION = "gv";
			AIRTOWER.GET_SERVERS = "gs";
			AIRTOWER.MOD_REQUEST = "xy";
			AIRTOWER.SWF_COMMAND = "fc";
			AIRTOWER.UPDATE_MOOD = "umo";
			AIRTOWER.PRIVATE_MSG = "pmsg";
			AIRTOWER.GET_USERLOG = "glog";
			AIRTOWER.NEW_USERLOG = "nlog";
			AIRTOWER.TIMER_KICK = "tk";
			AIRTOWER.LOAD_MOVIE = "lm";
			AIRTOWER.addListener(AIRTOWER.PLUGIN_LOAD,this.handlePluginLoad);
			AIRTOWER.addListener(AIRTOWER.SERVER_DATA,this.handleServerData);
			AIRTOWER.addListener(AIRTOWER.GET_VERSION,this.handleGetVersion);
			AIRTOWER.addListener(AIRTOWER.GET_SERVERS,this.handleServers);
			AIRTOWER.addListener(AIRTOWER.MOD_REQUEST,this.handleModRequest);
			AIRTOWER.addListener(AIRTOWER.SWF_COMMAND,this.handleSwfCommand);
			AIRTOWER.addListener(AIRTOWER.UPDATE_MOOD,this.handleUpdateMood);
			AIRTOWER.addListener(AIRTOWER.PRIVATE_MSG,this.handlePrivateMsg);
			AIRTOWER.addListener(AIRTOWER.TIMER_KICK,this.handleTimerKick);
			AIRTOWER.addListener(AIRTOWER.LOAD_MOVIE,this.handleLoadMovie);
			AIRTOWER.addListener(AIRTOWER.GET_USERLOG,this.bakeHandler(AIRTOWER.GET_USERLOG));
			AIRTOWER.addListener(AIRTOWER.NEW_USERLOG,this.bakeHandler(AIRTOWER.NEW_USERLOG));
			AIRTOWER.addListener("l",this.handleLoginResponse);

			SHELL.redemption_server.ip = this.HOST;
			SHELL.redemption_server.port = 9875;
			SHELL.createEmptyMovieClip("core_mc",SHELL.getNextHighestDepth());
			
			SHELL.loadSWFb = SHELL.loadSWF;

			SHELL.loadSWF = function(a, b, c, d, e, f) {
				for (var _loc8_ in _level0.CLIENT.REPLACES) {
					b = _level0.CLIENT.REPLACES.register3(b);
				}
				return this.loadSWFb(a,b,c,d,e,f);
			};

			SHELL.makePlayerObjectFromStringB = SHELL.makePlayerObjectFromString;

			SHELL.makePlayerObjectFromString = function(str) {
				var _loc2_ = SHELL.makePlayerObjectFromStringB(str);
				_loc2_.data = str.split("|");
				return _loc2_;
			};
		}
		
		System.security.allowDomain.call(_level1,"*");
		
		for(var _loc5_ in this.PLUGINS) {
			if(this.PLUGINS[_loc5_][1])
			{
			this.PLUGINS[_loc5_][0]();
			}
		}
		_root.onEnterFrame = this.waitForInterface;
	}

	function handleLoginResponse(obj) {
		var _loc2_ = obj[1];
		trace("login");
		trace(obj[1]);
	}

	function handleServers(obj) {
		trace("Handling Servers");
		for(var _loc2_ in _level0.CLIENT.PENGUIN.GLOBAL_CRUMBS.servers)
		{
			delete _level0.CLIENT.PENGUIN.GLOBAL_CRUMBS.servers.register3;
			delete _level0.CLIENT.PENGUIN.SHELL.world_crumbs.register3;
		}
		var _loc3_ = obj[1].split("|");
		for(_loc2_ in _loc3_)
		{
			_loc2_ = _loc3_[_loc2_];
			var _loc4_ = _loc2_.split(":");
			_level0.CLIENT.addServer(_loc4_[2],_loc4_[0],_loc4_[1],_loc4_[3]);
		}
	}

	function addServer(name, ip, port, population) {
		var _loc5_ = 0;
		
		for(var _loc6_ in _level0.CLIENT.PENGUIN.GLOBAL_CRUMBS.servers) {
			_loc5_ += 1;
		}

		_loc5_ += 1;
		trace(_loc5_);
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[100] = {name:"World 1",ip:"servers.cpcontinued.com",port:"6112",id:100,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[101] = {name:"World 2",ip:"servers.cpcontinued.com",port:"6113",id:101,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[102] = {name:"Antarctic",ip:"servers.cpcontinued.com",port:"6114",is_safe:true,id:102,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[103] = {name:"Half-Pipe",ip:"servers.cpcontinued.com",port:"6115",id:103,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[104] = {name:"Blizzard",ip:"servers.cpcontinued.com",port:"6116",id:104,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[105] = {name:"Ascent",ip:"servers.cpcontinued.com",port:"6117",id:105,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[106] = {name:"Zipline",ip:"servers.cpcontinued.com",port:"6118",id:106,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[107] = {name:"Deep Freeze",ip:"servers.cpcontinued.com",port:"6119",id:107,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[108] = {name:"Beanie",ip:"servers.cpcontinued.com",port:"6120",id:108,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[109] = {name:"Puffin",ip:"servers.cpcontinued.com",port:"6121",id:109,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[110] = {name:"Marshmellow",ip:"servers.cpcontinued.com",port:"6122",id:110,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[111] = {name:"Snow Angel",ip:"servers.cpcontinued.com",port:"6123",is_safe:true,id:111,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[112] = {name:"Grasshopper",ip:"servers.cpcontinued.com",port:"6124",id:112,population:population};
		_level0.CLIENT.PENGUIN.SHELL.world_crumbs[113] = {name:"# Herbert #",ip:"servers.cpcontinued.com",port:"7000",id:113,population:population};
	}

	function bakeHandler(handler) {
		if (_level0.CLIENT.HANDLERS[handler]) {
			_level0.CLIENT.HANDLERS[handler] = {};
		}

		return function(rObj) {
			_level0.CLIENT.HANDLERVARS = [];
			for (var _loc2_ in rObj) {
				_level0.CLIENT.HANDLERVARS[_loc2_] = rObj[_loc2_];
			}

			for (_loc2_ in _level0.CLIENT.HANDLERS[handler]) {
				_level0.CLIENT.HANDLERS[handler].register2(_level0.CLIENT.HANDLERVARS);
			}
		};
	}
	function handlePrivateMsg(obj) {
		obj.shift();
		var _loc2_ = obj.shift();
		var _loc3_ = obj.shift();
		var _loc4_ = obj.shift();

		with (_level0.CLIENT.PENGUIN) {
			INTERFACE.openLog();
			addToChatLog({player_id:_loc3_,nickname:_loc2_,message:_loc4_,type:SEND_BLOCKED_MESSAGE});
		}
	}

	function handleTimerKick(obj) {
		var _loc2_ = obj.shift();
		var _loc3_ = obj.shift();
		with (_level0.CLIENT.PENGUIN) {
			INTERFACE.showPrompt("ok", _loc3_ + "Egg timer has been set.");
			SHELL.egg_timer_milliseconds_remaining = _loc2_ * 60000;
			SHELL.setIsEggTimerActive(true);
		}
	}

	function handleLoadMovie(obj) {
		trace("Loading Movie...");
		obj.shift();
		loadMovieNum(obj.shift(), 5, "GET");
	}

	function handleUpdateMood(obj) {
		var _loc2_ = obj.shift();
		var _loc3_ = obj.shift();
		_level0.CLIENT.PENGUIN.INTERFACE.getPlayerObject(_loc2_).data[19] = _loc3_;

		if (_level0.CLIENT.PENGUIN.INTERFACE.getActivePlayerId() == _loc2_) {
		
		}
	}

	function handleSwfCommand(obj) {
		obj.shift();
		var _loc3_ = obj.shift();
		var _loc4_ = this[_loc3_].apply(this,obj);
		with (_level0.CLIENT.PENGUIN.AIRTOWER) {
			send(PLAY_EXT,ICP_HANDLER + "#" + SWF_COMMAND, [_loc4_], "str", -1);
		}
	}

	function handleession(obj) {
		obj.shift();
		var _loc2_ = obj.shift();
		var _loc3_ = obj.shift();
		var _loc4_ = obj.shift();
		var _loc5_ = obj.shift();
		_level0.CLIENT.PENGUIN.SHELL.showErrorPrompt(_loc2_, _loc3_, _loc4_, undefined, _loc5_);
	}

	function waitForInterface() {
		with (_level0.CLIENT.PENGUIN) {
			if	(INTERFACE) {
				_level0.CLIENT._fireEvent("INTERFACE");
			}

			if (ENGINE) {
				_level0.CLIENT._fireEvent("ENGINE");
			}
			
			if (!INTERFACE || !ENGINE) {
				return undefined;
			}

			INTERFACE.convertToSafeCase = function(txt) {
				return txt;
			};

			INTERFACE.isClickableLogItem = function() {
				return true;
			};
			
			INTERFACE.updatePlayerWidgetB = function(a, b, c, d, e, f, g) {
				if(g) {
					var _loc8_ = INTERFACE.updatePlayerWidgetB(a,b,c,d,e,f,g);
				}
				return _loc8_;
			};
			
			ENGINE.randomizeNearPosition = function(player, x, y, range) {
				player.x = x;
				player.y = y;
				return true;
			};
		}

		for (var _loc3_ in this.CLIENT.PLUGINS) {
			if (this.CLIENT.PLUGINS[_loc3_][1]) {
				this.CLIENT.PLUGINS[_loc3_][0]();
			}
		}
		
		delete this.onEnterFrame;
		delete _root.onEnterFrame;
		
		this.onEnterFrame = function() {

		};

	}

	function doModeratorAction(action) {
		switch(action)
		{
			case "openChatlog":
			case "joinRoom":
			case "goInvisible":
			case "getPlayerInfos":
			case "leaveMeAlone":
		}
	}

	function handleModRequest(obj) {
		obj.shift();
		var _loc3_ = Number(obj.shift());
		var _loc4_ = String(obj.shift());
		var _loc5_ = String(obj.shift());
		var _loc6_ = Number(obj.shift());
		var _loc7_ = String(obj.shift());
		var _loc8_ = Number(obj.shift());
		var _loc9_ = "fv?";
		this.PLUGIN_HOLDER.Core.modReport_mc.reason.text = _loc4_;
		this.PLUGIN_HOLDER.Core.modReport_mc.roomID.text = _loc3_;
		this.PLUGIN_HOLDER.Core.modReport_mc.roomName.text = _loc9_;
		this.PLUGIN_HOLDER.Core.modReport_mc.reporterPlayerName.text = _loc5_;
		this.PLUGIN_HOLDER.Core.modReport_mc.reporterPlayerID.text = _loc6_;
		this.PLUGIN_HOLDER.Core.modReport_mc.reportedPlayerName.text = _loc7_;
		this.PLUGIN_HOLDER.Core.modReport_mc.reportedPlayerID.text = _loc8_;
		_level2.debug_txt.text = "Received mod report.";
		_level0.modReport_mc._visible = false;
	}

	function handlePluginLoad(obj) {
		obj.shift();
		with(_level0.CLIENT)
		{
			PLUGIN_HOLDER.createEmptyMovieClip(obj[0],PLUGIN_HOLDER.getNextHighestDepth());
			PLUGIN_HOLDER[obj[0]].loadMovie(obj[1]);
		}
		with(_level0.CLIENT.PENGUIN.AIRTOWER)
		{
			send(PLAY_EXT,ICP_HANDLER + "#" + PLUGIN_LOAD,["I Can Haz airtower..."],"str",-1);
		}
	}

	function handleServerData(obj) {
		obj.shift();
		with(_level0.CLIENT.PENGUIN)
		{
			SHELL.world_crumbs = new Array();
			var _loc2_ = new Array();
			for(var _loc3_ in obj)
			{
			var _loc4_ = obj[_loc3_].split("|");
			SHELL.world_crumbs[_loc4_[0]] = {id:_loc4_[0],name:_loc4_[1],ip:_loc4_[2],port:_loc4_[3]};
			}
		}
		with(_level0.CLIENT.PENGUIN.AIRTOWER)
		{
			send(PLAY_EXT,ICP_HANDLER + "#" + SERVER_DATA,["Lalalala."],"str",-1);
		}
	}

	function handleGetVersion(obj) {
		with(_level0.CLIENT.PENGUIN.AIRTOWER)
		{
			send(PLAY_EXT,ICP_HANDLER + "#" + GET_VERSION,[org.iCPTeam.iCPThree.iCPLoader.VNUMBER],"str",-1);
		}
	}

	function _fireEvent(evtName) {
		for(var _loc2_ in _level0.CLIENT.HANDLERS[evtName])
		{
			_level0.CLIENT.HANDLERS[evtName].register2();
		}
		_level0.CLIENT.HANDLERS[evtName] = {};
	}

	function _airtowerHandler(handler) {
		return this.PENGUIN.AIRTOWER.addListener(handler,this.bakeHandler(handler));
	}

	function _setTextFormat(array, o) {
		var _loc4_ = this._getProperty(array);
		var _loc5_ = new TextFormat();
		for(var _loc6_ in o)
		{
			_loc5_[_loc6_] = o[_loc6_];
		}
		return _loc4_.setTextFormat(_loc5_);
	}

	function _getProperty(array) {
		var _loc3_ = this.PENGUIN;
		var _loc4_ = 0;
		while(_loc4_ < array.length)
		{
			_loc3_ = _loc3_[array[_loc4_]];
			_loc4_ += 1;
		}
		return _loc3_;
	}

	function _setProperty(array, data) {
		var _loc4_ = this.PENGUIN;
		var _loc5_ = 0;
		while(_loc5_ < array.length)
		{
			if(array.length == _loc5_ + 1)
			{
			_loc4_[array[_loc5_]] = data;
			}
			_loc4_ = _loc4_[array[_loc5_]];
			_loc5_ += 1;
		}
	}

	function _call(array, a, b, c, d, e, f, g, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z) {
		var _loc28_ = this.PENGUIN;
		i = 0;
		while(i < array.length)
		{
			if(array.length == i + 1)
			{
			return _loc28_[array[i]](a,b,c,d,e,f,g,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z);
			}
			_loc28_ = _loc28_[array[i]];
			i += 1;
		}
	}

	function _makeCallback(shareVar) {
		var original = this.SHAREVARS[shareVar];
		this.SHAREVARS[shareVar] = function(a, b, c, d, e, f, g, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z)
		{
			return original(a,b,c,d,e,f,g,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z);
		};
	}

	function _callWithShareVars(array, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z) {
		a = this.SHAREVARS[a];
		b = this.SHAREVARS[b];
		c = this.SHAREVARS[c];
		d = this.SHAREVARS[d];
		e = this.SHAREVARS[e];
		f = this.SHAREVARS[f];
		g = this.SHAREVARS[g];
		h = this.SHAREVARS[h];
		i = this.SHAREVARS[i];
		j = this.SHAREVARS[j];
		k = this.SHAREVARS[k];
		l = this.SHAREVARS[l];
		m = this.SHAREVARS[m];
		n = this.SHAREVARS[n];
		o = this.SHAREVARS[o];
		p = this.SHAREVARS[p];
		q = this.SHAREVARS[q];
		r = this.SHAREVARS[r];
		s = this.SHAREVARS[s];
		t = this.SHAREVARS[t];
		u = this.SHAREVARS[u];
		v = this.SHAREVARS[v];
		w = this.SHAREVARS[w];
		x = this.SHAREVARS[x];
		y = this.SHAREVARS[y];
		z = this.SHAREVARS[z];
		return this._call(array,a,b,c,d,e,f,g,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z);
	}

	function _callBase(array, a, b, c, d, e, f, g, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z) {
		return this._useBase(this._call(array,a,b,c,d,e,f,g,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z));
	}

	function _apply(array, base, args) {
		var _loc5_ = this.PENGUIN;
		var _loc6_ = 0;
		while(_loc6_ < array.length)
		{
			if(array.length == _loc6_ + 1)
			{
			return _loc5_[array[_loc6_]].apply(base,args);
			}
			_loc5_ = _loc5_[array[_loc6_]];
			_loc6_ += 1;
		}
	}

	function _foreach(array) {
		var _loc3_ = this.PENGUIN;
		var _loc4_ = {};
		var _loc5_ = 0;
		while(_loc5_ < array.length)
		{
			_loc3_ = _loc3_[array[_loc5_]];
			_loc5_ += 1;
		}
		for(_loc5_ in _loc3_)
		{
			_loc4_[_loc5_] = _loc3_[_loc5_];
		}
		return _loc4_;
	}

	function _clone(array, level, a) {
		var _loc5_ = this.PENGUIN;
		var _loc6_ = {};
		var _loc7_ = 0;
		while(_loc7_ < array.length)
		{
			_loc5_ = _loc5_[array[_loc7_]];
			_loc7_ += 1;
		}
		_loc6_ = this.secretForeach(_loc5_,level,a);
		return _loc6_;
	}

	function secretForeach(object, level, a) {
		var _loc5_ = {};
		for(var _loc6_ in object)
		{
			if((typeof object[_loc6_] == "object" || a) && level != 0)
			{
			_loc5_[_loc6_] = this.secretForeach(object[_loc6_],level - 1);
			}
			else
			{
			_loc5_[_loc6_] = object[_loc6_];
			}
		}
		return _loc5_;
	}

	function _delete(array) {
		var _loc3_ = this.PENGUIN;
		var _loc4_ = 0;
		while(_loc4_ < array.length)
		{
			if(array.length == _loc4_ + 1)
			{
			delete register4[array[_loc4_]];
			}
			_loc3_ = _loc3_[array[_loc4_]];
			_loc4_ += 1;
		}
	}

	function _setTimeout(cmd, interval) {
		this.PENGUIN.setTimeout(cmd,interval);
	}

	function _useBase(base) {
		return this.PENGUIN = base;
	}

	function _restoreBase() {
		return this.PENGUIN = _global.PenguBackup;
	}

	function _glow(mcP, a, b, c, d, e, f, g, h) {
		var _loc11_ = this._getProperty(mcP);
		var _loc12_ = new flash.filters.GlowFilter(a,b,c,d,e,f,g,h);
		var _loc13_ = new Array();
		_loc13_.push(_loc12_);
		_loc11_.filters = _loc13_;
	}

	function _initLoader() {
		_level0.CLIENT.loader = new MovieClipLoader();
		_level0.CLIENT.loader.addListener({
			onLoadInit: this.dumbHandler,
			onLoadError: this.dumbHandler,
			onLoadProgress: this.dumbHandler,
			onLoadStart: this.dumbHandler,
			onLoadComplete: this.dumbHandler
		});
		return _level0.CLIENT.loader;
	}

	function _addReplace(func) {
		var _loc3_ = this.REPLACES.length;
		this.REPLACES[_loc3_] = func;
		return _loc3_;
	}

	function _removeReplace(id) {
		if (this.REPLACES[id]) {
			delete this.REPLACES.id;
		} else {
			for (var _loc3_ in this.REPLACES) {
				if (this.REPLACES[_loc3_] == id) {
					delete this.REPLACES.register3;
				}
			}
		}
	}

	function dumbHandler(mc) {
		_level0.CLIENT.PENGUIN.LAST_EVENT_MC = mc;
	}

}
