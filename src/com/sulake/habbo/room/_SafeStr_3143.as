// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room._SafeStr_3143

package com.sulake.habbo.room
{
    import com.sulake.room.IRoomContentLoader;
    import com.sulake.habbo.session.furniture._SafeStr_1707;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.utils._SafeStr_68;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.habbo.utils.StringUtil;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import flash.net.URLRequest;
    import com.sulake.core.utils._SafeStr_39;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;

    [SecureSWF(rename="true")]
    public class _SafeStr_3143 implements IRoomContentLoader, _SafeStr_1707, _SafeStr_13 
    {

        public static const CONTENT_LOADER_READY:String = "RCL_LOADER_READY";
        private static const ASSET_LIBRARY_NAME_PREFIX:String = "RoomContentLoader ";
        private static const STATE_CREATED:int = 0;
        private static const STATE_INITIALIZING:int = 1;
        private static const STATE_READY:int = 2;
        private static const PLACE_HOLDER_FURNITURE:String = "place_holder";
        private static const PLACE_HOLDER_WALL_ITEM:String = "wall_place_holder";
        private static const PLACE_HOLDER_PET:String = "pet_place_holder";
        private static const PLACE_HOLDER_DEFAULT:String = "place_holder";
        private static const ROOM_CONTENT:String = "room";
        private static const _SafeStr_8875:String = "tile_cursor";
        private static const _SafeStr_8905:String = "selection_arrow";
        private static const PLACE_HOLDER_TYPES:Array = ["place_holder", "wall_place_holder", "pet_place_holder", "room", "tile_cursor", "selection_arrow"];
        private static const PLACE_HOLDER_TYPES_GPU:Array = ["place_holder", "wall_place_holder", "pet_place_holder", "room", "selection_arrow"];
        private static const CONTENT_DROP_DELAY:int = 20000;
        private static const COMPRESSION_INTERVAL:int = 30000;
        private static const CACHE_KEY_PREFIX:String = "furniture/";

        private var _SafeStr_4591:String;
        private var _SafeStr_4273:_SafeStr_24 = null;
        private var _SafeStr_3983:_SafeStr_24 = null;
        private var _SafeStr_4283:_SafeStr_24 = null;
        private var _SafeStr_4282:_SafeStr_24 = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _SafeStr_3734:int = 0;
        private var _stateEvents:IEventDispatcher = null;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4286:Boolean = false;
        private var _SafeStr_4274:_SafeStr_24 = null;
        private var _SafeStr_4284:Dictionary = new Dictionary();
        private var _SafeStr_4275:_SafeStr_24 = null;
        private var _SafeStr_4276:_SafeStr_24 = null;
        private var _wallItems:Dictionary = new Dictionary();
        private var _SafeStr_4277:_SafeStr_24 = null;
        private var _SafeStr_4272:_SafeStr_24 = null;
        private var _SafeStr_4271:Dictionary = new Dictionary();
        private var _petColors:_SafeStr_24 = null;
        private var _petLayers:_SafeStr_24 = null;
        private var _SafeStr_4278:_SafeStr_24 = null;
        private var _SafeStr_4279:_SafeStr_24 = null;
        private var _SafeStr_4280:_SafeStr_24 = null;
        private var _SafeStr_4281:_SafeStr_24 = null;
        private var _SafeStr_4289:String;
        private var _SafeStr_4288:String;
        private var _SafeStr_4287:String;
        private var _SafeStr_4290:String;
        private var _SafeStr_4291:String;
        private var _SafeStr_4270:Boolean = false;
        private var _lastAssetCompressionTime:uint;
        private var _sessionDataManager:ISessionDataManager;
        private var _SafeStr_4292:_SafeStr_21;
        private var _SafeStr_4293:_SafeStr_1690;
        private var _configuration:_SafeStr_19;
        private var _SafeStr_4285:Array;

        public function _SafeStr_3143(_arg_1:String)
        {
            _SafeStr_4591 = _arg_1;
            _SafeStr_4273 = new _SafeStr_24();
            _SafeStr_3983 = new _SafeStr_24();
            _SafeStr_4274 = new _SafeStr_24();
            _SafeStr_4275 = new _SafeStr_24();
            _SafeStr_4276 = new _SafeStr_24();
            _SafeStr_4277 = new _SafeStr_24();
            _SafeStr_4272 = new _SafeStr_24();
            _SafeStr_4281 = new _SafeStr_24();
            _SafeStr_4278 = new _SafeStr_24();
            _SafeStr_4279 = new _SafeStr_24();
            _SafeStr_4280 = new _SafeStr_24();
            _SafeStr_4282 = new _SafeStr_24();
            _SafeStr_4283 = new _SafeStr_24();
        }

        private function get fileProxy():_SafeStr_68
        {
            return (_SafeStr_79.instance.fileProxy);
        }

        public function set sessionDataManager(_arg_1:ISessionDataManager):void
        {
            _sessionDataManager = _arg_1;
            if (_SafeStr_4270)
            {
                _SafeStr_4270 = false;
                initFurnitureData();
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function set visualizationFactory(_arg_1:IRoomObjectVisualizationFactory):void
        {
            _visualizationFactory = _arg_1;
        }

        public function initialize(_arg_1:IEventDispatcher, _arg_2:_SafeStr_19):void
        {
            _stateEvents = _arg_1;
            _SafeStr_4289 = _arg_2.getProperty("flash.dynamic.download.url");
            _SafeStr_4288 = _arg_2.getProperty("flash.dynamic.download.name.template");
            _SafeStr_4287 = _arg_2.getProperty("flash.dynamic.icon.download.name.template");
            _SafeStr_4290 = _arg_2.getProperty("pet.dynamic.download.url");
            _SafeStr_4291 = _arg_2.getProperty("pet.dynamic.download.name.template");
            _configuration = _arg_2;
            _SafeStr_3734 = 1;
            initFurnitureData();
            initPetData(_arg_2);
        }

        private function initPetData(_arg_1:_SafeStr_19):void
        {
            var _local_2:Array = _arg_1.getProperty("pet.configuration").split(",");
            var _local_3:int;
            for each (var _local_4:String in _local_2)
            {
                _SafeStr_4271[_local_4] = _local_3;
                _SafeStr_4272.add(_local_3, _local_4);
                _local_3++;
            };
            _petColors = new _SafeStr_24();
            _petLayers = new _SafeStr_24();
        }

        private function initFurnitureData():void
        {
            if (_sessionDataManager == null)
            {
                _SafeStr_4270 = true;
                return;
            };
            var _local_1:Vector.<_SafeStr_3130> = _sessionDataManager.getFurniData(this);
            if (_local_1 == null)
            {
                return;
            };
            _sessionDataManager.removeFurniDataListener(this);
            populateFurniData(_local_1);
            _SafeStr_4286 = true;
            parseIgnoredFurniTypes();
            continueInitilization();
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_SafeStr_4273 != null)
            {
                _local_2 = _SafeStr_4273.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_1 = (_SafeStr_4273.getWithIndex(_local_3) as AssetLibrary);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_3++;
                };
                _SafeStr_4273.dispose();
                _SafeStr_4273 = null;
            };
            if (_SafeStr_3983 != null)
            {
                _SafeStr_3983.dispose();
                _SafeStr_3983 = null;
            };
            if (_SafeStr_4274 != null)
            {
                _SafeStr_4274.dispose();
                _SafeStr_4274 = null;
            };
            if (_SafeStr_4275)
            {
                _SafeStr_4275.dispose();
                _SafeStr_4275 = null;
            };
            if (_SafeStr_4276 != null)
            {
                _SafeStr_4276.dispose();
                _SafeStr_4276 = null;
            };
            if (_SafeStr_4277)
            {
                _SafeStr_4277.dispose();
                _SafeStr_4277 = null;
            };
            if (_SafeStr_4272 != null)
            {
                _SafeStr_4272.dispose();
                _SafeStr_4272 = null;
            };
            if (_petColors != null)
            {
                _petColors.dispose();
                _petColors = null;
            };
            if (_petLayers != null)
            {
                _petLayers.dispose();
                _petLayers = null;
            };
            if (_SafeStr_4278 != null)
            {
                _SafeStr_4278.dispose();
                _SafeStr_4278 = null;
            };
            if (_SafeStr_4279 != null)
            {
                _SafeStr_4279.dispose();
                _SafeStr_4279 = null;
            };
            if (_SafeStr_4280 != null)
            {
                _SafeStr_4280.dispose();
                _SafeStr_4280 = null;
            };
            if (_SafeStr_4281 != null)
            {
                _SafeStr_4281.dispose();
                _SafeStr_4281 = null;
            };
            if (_SafeStr_4282 != null)
            {
                _local_2 = _SafeStr_4282.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = (_SafeStr_4282.getWithIndex(_local_3) as IGraphicAssetCollection);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    };
                    _local_3++;
                };
                _SafeStr_4282.dispose();
                _SafeStr_4282 = null;
            };
            if (_SafeStr_4283 != null)
            {
                _SafeStr_4283.dispose();
                _SafeStr_4283 = null;
            };
            if (_SafeStr_4284 != null)
            {
                for (_local_5 in _SafeStr_4284)
                {
                    delete _SafeStr_4284[_local_5];
                };
                _SafeStr_4284 = null;
            };
            if (_wallItems != null)
            {
                for (_local_5 in _wallItems)
                {
                    delete _wallItems[_local_5];
                };
                _wallItems = null;
            };
            if (_SafeStr_4271 != null)
            {
                for (_local_5 in _SafeStr_4271)
                {
                    delete _SafeStr_4271[_local_5];
                };
                _SafeStr_4271 = null;
            };
            _stateEvents = null;
            _sessionDataManager = null;
            _configuration = null;
            _SafeStr_4036 = true;
        }

        private function parseIgnoredFurniTypes():void
        {
            var _local_3:int;
            var _local_1:String = _configuration.getProperty("gpu.ignored_furni");
            if (!_local_1)
            {
                return;
            };
            _SafeStr_4285 = _local_1.split(",");
            var _local_2:int = _SafeStr_4285.length;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4285[_local_3] = StringUtil.trim(_SafeStr_4285[_local_3]);
                _local_3++;
            };
        }

        private function isIgnoredFurniType(_arg_1:String):Boolean
        {
            return ((_SafeStr_4285) ? (!(_SafeStr_4285.indexOf(_arg_1) == -1)) : false);
        }

        private function populateFurniData(_arg_1:Vector.<_SafeStr_3130>):void
        {
            var _local_3:* = null;
            var _local_4:int;
            var _local_6:* = null;
            var _local_8:int;
            var _local_2:* = null;
            var _local_7:* = null;
            var _local_5:int;
            for each (_local_3 in _arg_1)
            {
                _local_4 = _local_3.id;
                _local_6 = _local_3.className;
                if (_local_3.hasIndexedColor)
                {
                    _local_6 = ((_local_6 + "*") + _local_3.colourIndex);
                };
                _local_8 = _local_3.revision;
                _local_2 = _local_3.adUrl;
                if (((!(_local_2 == null)) && (_local_2.length > 0)))
                {
                    _SafeStr_4281.add(_local_6, _local_2);
                };
                _local_7 = _local_3.className;
                if (_local_3.type == "s")
                {
                    _SafeStr_4274.add(_local_4, _local_6);
                    _SafeStr_4275.add(_local_6, _local_4);
                    if (_SafeStr_4284[_local_7] == null)
                    {
                        _SafeStr_4284[_local_7] = 1;
                    };
                }
                else
                {
                    if (_local_3.type == "i")
                    {
                        if (_local_6 == "post.it")
                        {
                            _local_6 = "post_it";
                            _local_7 = "post_it";
                        };
                        if (_local_6 == "post.it.vd")
                        {
                            _local_6 = "post_it_vd";
                            _local_7 = "post_it_vd";
                        };
                        _SafeStr_4276.add(_local_4, _local_6);
                        _SafeStr_4277.add(_local_6, _local_4);
                        if (_wallItems[_local_7] == null)
                        {
                            _wallItems[_local_7] = 1;
                        };
                    };
                };
                _local_5 = _SafeStr_4278.getValue(_local_7);
                if (_local_8 > _local_5)
                {
                    _SafeStr_4278.remove(_local_7);
                    _SafeStr_4278.add(_local_7, _local_8);
                };
            };
        }

        private function continueInitilization():void
        {
            if (_SafeStr_4286)
            {
                _SafeStr_3734 = 2;
                if (_stateEvents != null)
                {
                    _stateEvents.dispatchEvent(new Event("RCL_LOADER_READY"));
                };
            };
        }

        public function setRoomObjectAlias(_arg_1:String, _arg_2:String):void
        {
            if (_SafeStr_4279 != null)
            {
                _SafeStr_4279.remove(_arg_1);
                _SafeStr_4279.add(_arg_1, _arg_2);
            };
            if (_SafeStr_4280 != null)
            {
                _SafeStr_4280.remove(_arg_2);
                _SafeStr_4280.add(_arg_2, _arg_1);
            };
        }

        private function getRoomObjectAlias(_arg_1:String):String
        {
            var _local_2:String;
            if (_SafeStr_4279 != null)
            {
                _local_2 = (_SafeStr_4279.getValue(_arg_1) as String);
            };
            if (_local_2 == null)
            {
                _local_2 = _arg_1;
            };
            return (_local_2);
        }

        private function getRoomObjectOriginalName(_arg_1:String):String
        {
            var _local_2:String;
            if (_SafeStr_4280 != null)
            {
                _local_2 = (_SafeStr_4280.getValue(_arg_1) as String);
            };
            if (_local_2 == null)
            {
                _local_2 = _arg_1;
            };
            return (_local_2);
        }

        public function getObjectCategory(_arg_1:String):int
        {
            if (_arg_1 == null)
            {
                return (-2);
            };
            if (_SafeStr_4284[_arg_1] != null)
            {
                return (10);
            };
            if (_wallItems[_arg_1] != null)
            {
                return (20);
            };
            if (_SafeStr_4271[_arg_1] != null)
            {
                return (100);
            };
            if (_arg_1.indexOf("poster") == 0)
            {
                return (20);
            };
            if (_arg_1 == "room")
            {
                return (0);
            };
            if (_arg_1 == "user")
            {
                return (100);
            };
            if (_arg_1 == "pet")
            {
                return (100);
            };
            if (_arg_1 == "bot")
            {
                return (100);
            };
            if (_arg_1 == "rentable_bot")
            {
                return (100);
            };
            if (((_arg_1 == "tile_cursor") || (_arg_1 == "selection_arrow")))
            {
                return (200);
            };
            return (-2);
        }

        public function getPlaceHolderType(_arg_1:String):String
        {
            if (_SafeStr_4284[_arg_1] != null)
            {
                return ("place_holder");
            };
            if (_wallItems[_arg_1] != null)
            {
                return ("wall_place_holder");
            };
            if (_SafeStr_4271[_arg_1] != null)
            {
                return ("pet_place_holder");
            };
            return ("place_holder");
        }

        public function getPlaceHolderTypes():Array
        {
            return (PLACE_HOLDER_TYPES);
        }

        public function getActiveObjectType(_arg_1:int):String
        {
            var _local_2:String = (_SafeStr_4274.getValue(_arg_1) as String);
            if (_local_2 == null)
            {
                _SafeStr_14.log(("[RoomContentLoader] Could not find type for id: " + _arg_1));
            };
            return (getObjectType(_local_2));
        }

        public function getActiveObjectTypeId(_arg_1:String):int
        {
            return (_SafeStr_4275.getValue(_arg_1));
        }

        public function getWallItemType(_arg_1:int, _arg_2:String=null):String
        {
            var _local_3:String = (_SafeStr_4276.getValue(_arg_1) as String);
            if (((_local_3 == "poster") && (!(_arg_2 == null))))
            {
                _local_3 = (_local_3 + _arg_2);
            };
            return (getObjectType(_local_3));
        }

        public function getWallItemTypeId(_arg_1:String):int
        {
            return (_SafeStr_4277.getValue(_arg_1));
        }

        public function getPetType(_arg_1:int):String
        {
            return (_SafeStr_4272.getValue(_arg_1) as String);
        }

        public function getPetTypeId(_arg_1:String):int
        {
            return (_SafeStr_4271[_arg_1]);
        }

        public function getPetColor(_arg_1:int, _arg_2:int):PetColorResult
        {
            var _local_3:_SafeStr_24 = _petColors[_arg_1];
            if (_local_3 != null)
            {
                return (_local_3[_arg_2] as PetColorResult);
            };
            return (null);
        }

        public function getPetColorsByTag(_arg_1:int, _arg_2:String):Array
        {
            var _local_5:_SafeStr_24 = _petColors[_arg_1];
            var _local_3:Array = [];
            if (_local_5 != null)
            {
                for each (var _local_4:PetColorResult in _local_5.getValues())
                {
                    if (_local_4.tag == _arg_2)
                    {
                        _local_3.push(_local_4);
                    };
                };
            };
            return (_local_3);
        }

        public function getPetLayerIdForTag(_arg_1:int, _arg_2:String, _arg_3:int=64):int
        {
            var _local_5:* = null;
            var _local_4:_SafeStr_24 = _petLayers[_arg_1];
            if (_local_4)
            {
                _local_5 = _local_4[_arg_3.toString()];
                if (_local_5)
                {
                    return ((_local_5[_arg_2] != null) ? _local_5[_arg_2] : -1);
                };
            };
            return (-1);
        }

        public function getPetDefaultPalette(_arg_1:int, _arg_2:String):PetColorResult
        {
            var _local_4:_SafeStr_24 = _petColors[_arg_1];
            if (_local_4 != null)
            {
                for each (var _local_3:PetColorResult in _local_4.getValues())
                {
                    if (((_local_3.layerTags.indexOf(_arg_2) > -1) && (_local_3.isMaster)))
                    {
                        return (_local_3);
                    };
                };
            };
            return (null);
        }

        public function getActiveObjectColorIndex(_arg_1:int):int
        {
            var _local_2:String = (_SafeStr_4274.getValue(_arg_1) as String);
            return (getObjectColorIndex(_local_2));
        }

        public function getWallItemColorIndex(_arg_1:int):int
        {
            var _local_2:String = (_SafeStr_4276.getValue(_arg_1) as String);
            return (getObjectColorIndex(_local_2));
        }

        public function getRoomObjectAdURL(_arg_1:String):String
        {
            if (_SafeStr_4281.getValue(_arg_1) != null)
            {
                return (_SafeStr_4281.getValue(_arg_1));
            };
            return ("");
        }

        private function getObjectType(_arg_1:String):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:int = _arg_1.indexOf("*");
            if (_local_2 >= 0)
            {
                _arg_1 = _arg_1.substr(0, _local_2);
            };
            return (_arg_1);
        }

        private function getObjectColorIndex(_arg_1:String):int
        {
            if (_arg_1 == null)
            {
                return (-1);
            };
            var _local_3:int;
            var _local_2:int = _arg_1.indexOf("*");
            if (_local_2 >= 0)
            {
                _local_3 = _arg_1.substr((_local_2 + 1));
            };
            return (_local_3);
        }

        public function getContentType(_arg_1:String):String
        {
            return (_arg_1);
        }

        public function hasInternalContent(_arg_1:String):Boolean
        {
            _arg_1 = RoomObjectUserTypes.getVisualizationType(_arg_1);
            if ((((_arg_1 == "user") || (_arg_1 == "game_snowball")) || (_arg_1 == "game_snowsplash")))
            {
                return (true);
            };
            return (false);
        }

        private function getObjectRevision(_arg_1:String):int
        {
            var _local_3:int;
            var _local_2:int = getObjectCategory(_arg_1);
            if (((_local_2 == 10) || (_local_2 == 20)))
            {
                if (_arg_1.indexOf("poster") == 0)
                {
                    _arg_1 = "poster";
                };
                return (_SafeStr_4278.getValue(_arg_1));
            };
            return (0);
        }

        private function getObjectContentURLs(_arg_1:String, _arg_2:String=null, _arg_3:Boolean=false):Array
        {
            var _local_6:int;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_10:int;
            var _local_5:Boolean;
            var _local_9:* = null;
            var _local_7:String = getContentType(_arg_1);
            switch (_local_7)
            {
                case "place_holder":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("PlaceHolderFurniture.swf"))]);
                case "wall_place_holder":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("PlaceHolderWallItem.swf"))]);
                case "pet_place_holder":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("PlaceHolderPet.swf"))]);
                case "room":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("HabboRoomContent.swf"))]);
                case "tile_cursor":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("TileCursor.swf"))]);
                case "selection_arrow":
                    return ([new RoomContentLoaderURL(resolveLocalOrAssetBaseUrl("SelectionArrow.swf"))]);
                default:
                    _local_6 = getObjectCategory(_local_7);
                    if (((_local_6 == 10) || (_local_6 == 20)))
                    {
                        _local_4 = getRoomObjectAlias(_local_7);
                        _local_8 = ((_arg_3) ? _SafeStr_4287 : _SafeStr_4288);
                        _local_8 = _local_8.replace(/%typeid%/, _local_4);
                        _local_10 = getObjectRevision(_local_7);
                        _local_8 = _local_8.replace(/%revision%/, _local_10);
                        if (_arg_3)
                        {
                            _local_5 = (((!(_arg_2 == null)) && (!(_arg_2 == ""))) && (_SafeStr_4275.hasKey(((_arg_1 + "*") + _arg_2))));
                            _local_8 = _local_8.replace(/%param%/, ((_local_5) ? ("_" + _arg_2) : ""));
                        };
                        return ([new RoomContentLoaderURL((_SafeStr_4289 + _local_8), _arg_1, _local_10, _arg_3, [_arg_1, _arg_2].join("_"))]);
                    };
                    if (_local_6 == 100)
                    {
                        _local_9 = (_SafeStr_4290 + _SafeStr_4291);
                        _local_9 = _local_9.replace(/%type%/, _local_7);
                        return ([new RoomContentLoaderURL(_local_9)]);
                    };
            };
            return ([]);
        }

        private function resolveLocalOrAssetBaseUrl(_arg_1:String):String
        {
            var _local_2:* = null;
            if (((fileProxy) && (fileProxy.localFileExists(_arg_1))))
            {
                return (fileProxy.localFilePath(_arg_1));
            };
            return (_SafeStr_4290 + _arg_1);
        }

        public function insertObjectContent(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_21):Boolean
        {
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_5:String = getAssetLibraryType(_arg_3);
            switch (_arg_2)
            {
                case 10:
                    _SafeStr_4274[_arg_1] = _local_5;
                    _SafeStr_4275.add(_local_5, _arg_1);
                    break;
                case 20:
                    _SafeStr_4276[_arg_1] = _local_5;
                    break;
                default:
                    throw (new Error((("Registering content library for unsupported category " + _arg_2) + "!")));
            };
            var _local_4:AssetLibraryCollection = (addAssetLibraryCollection(_local_5, null) as AssetLibraryCollection);
            if (_local_4)
            {
                _local_4.addAssetLibrary(_arg_3);
                if (initializeGraphicAssetCollection(_local_5, _arg_3))
                {
                    switch (_arg_2)
                    {
                        case 10:
                            if (_SafeStr_4284[_local_5] == null)
                            {
                                _SafeStr_4284[_local_5] = 1;
                            };
                            break;
                        case 20:
                            if (_wallItems[_local_5] == null)
                            {
                                _wallItems[_local_5] = 1;
                            };
                            break;
                        default:
                            throw (new Error((("Registering content library for unsupported category " + _arg_2) + "!")));
                    };
                    _local_6 = new RoomContentLoadedEvent("RCLE_SUCCESS", _local_5);
                    _local_7 = getAssetLibraryEventDispatcher(_local_5, true);
                    if (_local_7)
                    {
                        _local_7.dispatchEvent(_local_6);
                    };
                    return (true);
                };
            };
            return (false);
        }

        public function getObjectUrl(_arg_1:String, _arg_2:String):String
        {
            var _local_3:* = null;
            var _local_4:String;
            if (((_arg_1) && (_arg_1.indexOf(",") >= 0)))
            {
                _local_4 = _arg_1;
                _arg_1 = _local_4.split(",")[0];
            };
            if (_local_4 != null)
            {
                _local_3 = getObjectContentURLs(_local_4, _arg_2, true);
            }
            else
            {
                _local_3 = getObjectContentURLs(_arg_1, _arg_2, true);
            };
            if (_local_3.length > 0)
            {
                return ((_local_3[0] as RoomContentLoaderURL).url);
            };
            return (null);
        }

        public function loadThumbnailContent(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:IEventDispatcher):Boolean
        {
            var _local_7:* = null;
            var _local_9:int;
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_8:* = null;
            var _local_10:String;
            if (((_arg_2) && (_arg_2.indexOf(",") >= 0)))
            {
                _local_10 = _arg_2;
                _arg_2 = _local_10.split(",")[0];
            };
            if (_local_10 != null)
            {
                _local_7 = getObjectContentURLs(_local_10, _arg_3, true);
            }
            else
            {
                _local_7 = getObjectContentURLs(_arg_2, _arg_3, true);
            };
            if (((!(_local_7 == null)) && (_local_7.length > 0)))
            {
                _local_9 = 0;
                while (_local_9 < _local_7.length)
                {
                    _local_6 = _local_7[_local_9];
                    _local_5 = _local_6.url;
                    _local_8 = _SafeStr_4292.loadAssetFromFile([_arg_2, _arg_3].join("_"), new URLRequest(_local_5), "image/png", null, null, _arg_1);
                    _local_8.addEventListener("AssetLoaderEventComplete", onContentLoaded);
                    _local_9++;
                };
                return (true);
            };
            return (false);
        }

        public function loadObjectContent(_arg_1:String, _arg_2:IEventDispatcher):Boolean
        {
            var _local_5:* = null;
            var _local_7:int;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            if (((_arg_1 == null) || (_arg_1 == "")))
            {
                _SafeStr_14.log("[RoomContentLoader] Can not load content, object type unknown!");
                return (false);
            };
            var _local_9:String;
            if (((_arg_1) && (_arg_1.indexOf(",") >= 0)))
            {
                _local_9 = _arg_1;
                _arg_1 = _local_9.split(",")[0];
            };
            if (((!(getAssetLibrary(_arg_1) == null)) || (!(getAssetLibraryEventDispatcher(_arg_1) == null))))
            {
                return (false);
            };
            var _local_8:AssetLibraryCollection = (addAssetLibraryCollection(_arg_1, _arg_2) as AssetLibraryCollection);
            if (_local_8 == null)
            {
                return (false);
            };
            if (isIgnoredFurniType(_arg_1))
            {
                _SafeStr_14.log(("Ignored object type found from configuration. Not downloading assets for: " + _arg_1));
                return (false);
            };
            if (_local_9 != null)
            {
                _local_5 = getObjectContentURLs(_local_9);
            }
            else
            {
                _local_5 = getObjectContentURLs(_arg_1);
            };
            if (((!(_local_5 == null)) && (_local_5.length > 0)))
            {
                _local_8.addEventListener("AssetLibraryLoaded", onContentLoaded);
                _local_7 = 0;
                while (_local_7 < _local_5.length)
                {
                    _local_6 = new _SafeStr_39();
                    _local_4 = _local_5[_local_7];
                    _local_3 = _local_4.url;
                    _local_8.loadFromFile(_local_6, true);
                    _local_6.addEventListener("LIBRARY_LOADER_EVENT_ERROR", onContentLoadError);
                    _local_6.load(new URLRequest(_local_3), ("furniture/" + _local_4.cacheKey), _local_4.cacheRevision);
                    _local_7++;
                };
                return (true);
            };
            return (false);
        }

        private function onContentLoadError(_arg_1:Event):void
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_39 = _SafeStr_39(_arg_1.target);
            var _local_5:Array = getPlaceHolderTypes();
            for each (var _local_2:String in _local_5)
            {
                _local_3 = getObjectContentURLs(_local_2);
                if ((((_local_3.length > 0) && (!(_local_4.url == null))) && (_local_4.url.indexOf((_local_3[0] as RoomContentLoaderURL).url) == 0)))
                {
                    _SafeStr_79.crash(("Failed to load asset: " + _local_4.url), 3);
                    return;
                };
            };
        }

        private function onContentLoaded(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (disposed)
            {
                return;
            };
            if ((_arg_1.target is AssetLoaderStruct))
            {
                _local_2 = (_arg_1.target as AssetLoaderStruct);
                _SafeStr_4293.iconLoaded(_local_2.assetLoader.id, _local_2.assetName, true);
            }
            else
            {
                _local_3 = (_arg_1.target as _SafeStr_21);
                if (_local_3 == null)
                {
                    return;
                };
                processLoadedLibrary(_local_3);
            };
        }

        private function processLoadedLibrary(_arg_1:_SafeStr_21):void
        {
            var _local_3:RoomContentLoadedEvent;
            var _local_2:Boolean;
            var _local_4:String = getAssetLibraryType(_arg_1);
            _local_4 = getRoomObjectOriginalName(_local_4);
            if (_local_4 != null)
            {
                _local_2 = initializeGraphicAssetCollection(_local_4, _arg_1);
            };
            if (_local_2)
            {
                if (_SafeStr_4271[_local_4] != null)
                {
                    extractPetDataFromLoadedContent(_local_4);
                };
                _local_3 = new RoomContentLoadedEvent("RCLE_SUCCESS", _local_4);
            }
            else
            {
                _local_3 = new RoomContentLoadedEvent("RCLE_FAILURE", _local_4);
            };
            var _local_5:IEventDispatcher = getAssetLibraryEventDispatcher(_local_4, true);
            if (((!(_local_5 == null)) && (!(_local_3 == null))))
            {
                _local_5.dispatchEvent(_local_3);
            };
        }

        private function extractPetDataFromLoadedContent(_arg_1:String):void
        {
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_9:* = null;
            var _local_13:* = null;
            var _local_8:int;
            var _local_16:int;
            var _local_2:* = null;
            var _local_14:Boolean;
            var _local_11:* = null;
            var _local_17:* = null;
            var _local_10:* = null;
            var _local_15:* = null;
            var _local_19:int = _SafeStr_4271[_arg_1];
            var _local_6:IGraphicAssetCollection = getGraphicAssetCollection(_arg_1);
            if (_local_6 != null)
            {
                _local_7 = new _SafeStr_24();
                _local_5 = _local_6.getPaletteNames();
                for each (var _local_12:String in _local_5)
                {
                    _local_9 = _local_6.getPaletteColors(_local_12);
                    if (((!(_local_9 == null)) && (_local_9.length >= 2)))
                    {
                        _local_13 = _local_6.getPaletteXML(_local_12);
                        _local_8 = int(_local_13.@breed);
                        _local_16 = ((_local_13.hasOwnProperty("@colortag")) ? _local_13.@colortag : -1);
                        _local_2 = ((_local_13.hasOwnProperty("@tags")) ? String(_local_13.@tags).split(",") : []);
                        _local_14 = ((_local_13.hasOwnProperty("@master")) ? (String(_local_13.@master) == "true") : false);
                        _local_7.add(_local_12, new PetColorResult(_local_9[0], _local_9[1], _local_8, _local_16, _local_12, _local_14, _local_2));
                    };
                };
                _petColors.add(_local_19, _local_7);
            };
            var _local_4:XML = getVisualizationXML(_arg_1);
            if (_local_4 != null)
            {
                _local_11 = new _SafeStr_24();
                for each (var _local_3:XML in _local_4.visualization)
                {
                    _local_17 = new Dictionary();
                    for each (var _local_18:XML in _local_3.layers.layer)
                    {
                        if (_local_18.hasOwnProperty("@tag"))
                        {
                            _local_10 = _local_18.@tag;
                            _local_17[_local_10] = parseInt(String(_local_18.@id));
                        };
                    };
                    _local_15 = _local_3.@size;
                    _local_11.add(_local_15, _local_17);
                };
                _petLayers.add(_local_19, _local_11);
            };
        }

        private function initializeGraphicAssetCollection(_arg_1:String, _arg_2:_SafeStr_21):Boolean
        {
            var _local_4:* = null;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return (false);
            };
            var _local_3:Boolean;
            var _local_5:IGraphicAssetCollection = createGraphicAssetCollection(_arg_1, _arg_2);
            if (_local_5 != null)
            {
                _local_4 = getAssetXML(_arg_1);
                if (_local_5.define(_local_4))
                {
                    _local_3 = true;
                }
                else
                {
                    disposeGraphicAssetCollection(_arg_1);
                };
            };
            return (_local_3);
        }

        public function extractObjectContent(_arg_1:String, _arg_2:String):Boolean
        {
            var _local_3:_SafeStr_21 = getAssetLibrary(_arg_1);
            _SafeStr_4283.add(_arg_2, _arg_1);
            if (initializeGraphicAssetCollection(_arg_2, _local_3))
            {
                return (true);
            };
            _SafeStr_4283.remove(_arg_2);
            return (false);
        }

        private function getAssetLibraryName(_arg_1:String):String
        {
            return ("RoomContentLoader " + _arg_1);
        }

        private function getAssetLibrary(_arg_1:String):_SafeStr_21
        {
            var _local_3:* = null;
            var _local_4:String = getContentType(_arg_1);
            _local_4 = getRoomObjectOriginalName(_local_4);
            var _local_2:_SafeStr_21 = (_SafeStr_4273.getValue(getAssetLibraryName(_local_4)) as _SafeStr_21);
            if (_local_2 == null)
            {
                _local_3 = _SafeStr_4283.getValue(_local_4);
                if (_local_3 != null)
                {
                    _local_4 = getContentType(_local_3);
                    _local_2 = (_SafeStr_4273.getValue(getAssetLibraryName(_local_4)) as _SafeStr_21);
                };
            };
            return (_local_2);
        }

        private function addAssetLibraryCollection(_arg_1:String, _arg_2:IEventDispatcher):_SafeStr_21
        {
            var _local_5:String = getContentType(_arg_1);
            var _local_3:_SafeStr_21 = getAssetLibrary(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3);
            };
            var _local_4:String = getAssetLibraryName(_local_5);
            _local_3 = new AssetLibraryCollection(_local_4);
            _SafeStr_4273.add(_local_4, _local_3);
            if (((!(_arg_2 == null)) && (getAssetLibraryEventDispatcher(_arg_1) == null)))
            {
                _SafeStr_3983.add(_local_5, _arg_2);
            };
            return (_local_3);
        }

        private function getAssetLibraryEventDispatcher(_arg_1:String, _arg_2:Boolean=false):IEventDispatcher
        {
            var _local_3:String = getContentType(_arg_1);
            if (!_arg_2)
            {
                return (_SafeStr_3983.getValue(_local_3));
            };
            return (_SafeStr_3983.remove(_local_3));
        }

        private function getIconAssetType(_arg_1:AssetLoaderStruct):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_4:String = _arg_1.assetName;
            var _local_2:Array = _local_4.split("_");
            var _local_5:int = parseInt(_local_2.pop());
            var _local_3:String = _local_2.join("_");
            return ((_local_5 > 0) ? ((_local_3 + "*") + _local_5) : _local_3);
        }

        private function getAssetLibraryType(_arg_1:_SafeStr_21):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:IAsset = _arg_1.getAssetByName("index");
            if (_local_3 == null)
            {
                return (null);
            };
            var _local_2:XML = (_local_3.content as XML);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_4:String = _local_2.@type;
            return (_local_4);
        }

        public function getVisualizationType(_arg_1:String):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:_SafeStr_21 = getAssetLibrary(_arg_1);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_4:IAsset = _local_2.getAssetByName((_arg_1 + "_index"));
            if (_local_4 == null)
            {
                _local_4 = _local_2.getAssetByName("index");
            };
            if (_local_4 == null)
            {
                return (null);
            };
            var _local_3:XML = (_local_4.content as XML);
            if (_local_3 == null)
            {
                return (null);
            };
            var _local_5:String = _local_3.@visualization;
            return (_local_5);
        }

        public function getLogicType(_arg_1:String):String
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:_SafeStr_21 = getAssetLibrary(_arg_1);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_4:IAsset = _local_2.getAssetByName((_arg_1 + "_index"));
            if (_local_4 == null)
            {
                _local_4 = _local_2.getAssetByName("index");
            };
            if (_local_4 == null)
            {
                return (null);
            };
            var _local_3:XML = (_local_4.content as XML);
            if (_local_3 == null)
            {
                return (null);
            };
            var _local_5:String = _local_3.@logic;
            return (_local_5);
        }

        public function hasVisualizationXML(_arg_1:String):Boolean
        {
            return (hasXML(_arg_1, "_visualization"));
        }

        public function getVisualizationXML(_arg_1:String):XML
        {
            return (getXML(_arg_1, "_visualization"));
        }

        public function hasAssetXML(_arg_1:String):Boolean
        {
            return (hasXML(_arg_1, "_assets"));
        }

        public function getAssetXML(_arg_1:String):XML
        {
            return (getXML(_arg_1, "_assets"));
        }

        public function hasLogicXML(_arg_1:String):Boolean
        {
            return (hasXML(_arg_1, "_logic"));
        }

        public function getLogicXML(_arg_1:String):XML
        {
            return (getXML(_arg_1, "_logic"));
        }

        private function getXML(_arg_1:String, _arg_2:String):XML
        {
            var _local_3:_SafeStr_21 = getAssetLibrary(_arg_1);
            if (_local_3 == null)
            {
                return (null);
            };
            var _local_7:String = getContentType(_arg_1);
            var _local_5:String = getRoomObjectAlias(_local_7);
            var _local_6:IAsset = _local_3.getAssetByName((_local_5 + _arg_2));
            if (_local_6 == null)
            {
                return (null);
            };
            var _local_4:XML = (_local_6.content as XML);
            if (_local_4 == null)
            {
                return (null);
            };
            return (_local_4);
        }

        private function hasXML(_arg_1:String, _arg_2:String):Boolean
        {
            var _local_3:_SafeStr_21 = getAssetLibrary(_arg_1);
            if (_local_3 == null)
            {
                return (false);
            };
            var _local_5:String = getContentType(_arg_1);
            var _local_4:String = getRoomObjectAlias(_local_5);
            return (_local_3.hasAsset((_local_4 + _arg_2)));
        }

        public function addGraphicAsset(_arg_1:String, _arg_2:String, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:Boolean=true):Boolean
        {
            var _local_6:IGraphicAssetCollection = getGraphicAssetCollection(_arg_1);
            if (_local_6 != null)
            {
                return (_local_6.addAsset(_arg_2, _arg_3, _arg_4, 0, 0, false, false));
            };
            return (false);
        }

        private function createGraphicAssetCollection(_arg_1:String, _arg_2:_SafeStr_21):IGraphicAssetCollection
        {
            var _local_3:IGraphicAssetCollection = getGraphicAssetCollection(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3);
            };
            if (_arg_2 == null)
            {
                return (null);
            };
            _local_3 = _visualizationFactory.createGraphicAssetCollection();
            if (_local_3 != null)
            {
                _local_3.assetLibrary = _arg_2;
                _SafeStr_4282.add(_arg_1, _local_3);
            };
            return (_local_3);
        }

        public function getGraphicAssetCollection(_arg_1:String):IGraphicAssetCollection
        {
            var _local_2:String = getContentType(_arg_1);
            return (_SafeStr_4282.getValue(_local_2) as IGraphicAssetCollection);
        }

        public function roomObjectCreated(_arg_1:IRoomObject, _arg_2:String):void
        {
            var _local_3:IRoomObjectController = (_arg_1 as IRoomObjectController);
            if (((_local_3) && (_local_3.getModelController())))
            {
                _local_3.getModelController().setString("object_room_id", _arg_2, true);
            };
        }

        private function disposeGraphicAssetCollection(_arg_1:String):Boolean
        {
            var _local_3:* = null;
            var _local_2:String = getContentType(_arg_1);
            if (_SafeStr_4282[_local_2] != null)
            {
                _local_3 = _SafeStr_4282.remove(_local_2);
                if (_local_3 != null)
                {
                    _local_3.dispose();
                };
                return (true);
            };
            return (false);
        }

        public function furniDataReady():void
        {
            initFurnitureData();
        }

        public function setActiveObjectType(_arg_1:int, _arg_2:String):void
        {
            _SafeStr_4274.remove(_arg_1);
            _SafeStr_4274.add(_arg_1, _arg_2);
        }

        public function compressAssets():void
        {
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_7:int;
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_8:int;
            var _local_9:* = null;
            var _local_1:int = _SafeStr_4282.length;
            var _local_6:Array = getPlaceHolderTypes();
            _local_7 = (_local_1 - 1);
            while (_local_7 > -1)
            {
                _local_10 = _SafeStr_4282.getKey(_local_7);
                if (_local_6.indexOf(_local_10) == -1)
                {
                    _local_5 = _SafeStr_4282.getValue(_local_10);
                    _local_2 = getAssetLibraryName(_local_10);
                    _local_3 = (_SafeStr_4273.getValue(_local_2) as _SafeStr_21);
                    if (_local_3)
                    {
                        _local_4 = _local_3.numAssets;
                        _local_8 = 0;
                        while (_local_8 < _local_4)
                        {
                            _local_9 = (_local_3.getAssetByIndex(_local_8) as BitmapDataAsset);
                            if (_local_9)
                            {
                            };
                            _local_8++;
                        };
                    };
                };
                _local_7--;
            };
            _lastAssetCompressionTime = getTimer();
        }

        public function purge():void
        {
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_5:int;
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:int = _SafeStr_4282.length;
            var _local_6:int = getTimer();
            _local_5 = (_local_1 - 1);
            while (_local_5 > -1)
            {
                _local_7 = _SafeStr_4282.getKey(_local_5);
                if (PLACE_HOLDER_TYPES.indexOf(_local_7) < 0)
                {
                    _local_4 = _SafeStr_4282.getValue(_local_7);
                    if (((_local_4.getReferenceCount() < 1) && ((_local_6 - _local_4.getLastReferenceTimeStamp()) >= 20000)))
                    {
                        _SafeStr_4282.remove(_local_7);
                        _local_4.dispose();
                        _local_2 = getAssetLibraryName(_local_7);
                        _local_3 = (_SafeStr_4273.getValue(_local_2) as _SafeStr_21);
                        if (_local_3)
                        {
                            _SafeStr_4273.remove(_local_2);
                            _local_3.dispose();
                        };
                    };
                };
                _local_5--;
            };
        }

        public function getCachePath(_arg_1:String):String
        {
            var _local_3:String = getContentType(_arg_1);
            if (((((((_local_3 == "place_holder") || (_local_3 == "wall_place_holder")) || (_local_3 == "pet_place_holder")) || (_local_3 == "room")) || (_local_3 == "tile_cursor")) || (_local_3 == "selection_arrow")))
            {
                return (null);
            };
            var _local_2:int = getObjectCategory(_local_3);
            if (((!(_local_2 == 10)) && (!(_local_2 == 20))))
            {
                return (null);
            };
            var _local_4:int = getObjectRevision(_local_3);
            return (((((("room_content/" + _arg_1) + "/") + _local_4) + "/") + _arg_1) + ".swf");
        }

        public function set iconAssets(_arg_1:_SafeStr_21):void
        {
            _SafeStr_4292 = _arg_1;
        }

        public function set iconListener(_arg_1:_SafeStr_1690):void
        {
            _SafeStr_4293 = _arg_1;
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1690 = "_-S11" (String#12313, DoABC#4)
// _SafeStr_1707 = "_-D8" (String#6997, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3143 = "_-s1i" (String#11487, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_39 = "_-N4" (String#4523, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4270 = "_-W9" (String#12407, DoABC#4)
// _SafeStr_4271 = "_-H1Y" (String#2974, DoABC#4)
// _SafeStr_4272 = "_-u1F" (String#7930, DoABC#4)
// _SafeStr_4273 = "_-W1p" (String#3935, DoABC#4)
// _SafeStr_4274 = "_-VT" (String#5570, DoABC#4)
// _SafeStr_4275 = "_-Um" (String#7009, DoABC#4)
// _SafeStr_4276 = "_-v1F" (String#7017, DoABC#4)
// _SafeStr_4277 = "_-P1t" (String#8011, DoABC#4)
// _SafeStr_4278 = "_-z14" (String#7016, DoABC#4)
// _SafeStr_4279 = "_-D1t" (String#5905, DoABC#4)
// _SafeStr_4280 = "_-y1l" (String#6469, DoABC#4)
// _SafeStr_4281 = "_-t1v" (String#7730, DoABC#4)
// _SafeStr_4282 = "_-b1Z" (String#3928, DoABC#4)
// _SafeStr_4283 = "_-n2" (String#7066, DoABC#4)
// _SafeStr_4284 = "_-I1R" (String#5269, DoABC#4)
// _SafeStr_4285 = "_-qn" (String#9978, DoABC#4)
// _SafeStr_4286 = "_-Fm" (String#22496, DoABC#4)
// _SafeStr_4287 = "_-G1" (String#22482, DoABC#4)
// _SafeStr_4288 = "_-so" (String#17990, DoABC#4)
// _SafeStr_4289 = "_-Zf" (String#19331, DoABC#4)
// _SafeStr_4290 = "_-W1J" (String#14181, DoABC#4)
// _SafeStr_4291 = "_-p9" (String#18165, DoABC#4)
// _SafeStr_4292 = "_-k1t" (String#17665, DoABC#4)
// _SafeStr_4293 = "_-Fn" (String#4092, DoABC#4)
// _SafeStr_4591 = "_-t1s" (String#4581, DoABC#4)
// _SafeStr_68 = "_-H1s" (String#30500, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)
// _SafeStr_8875 = "_-ek" (String#30040, DoABC#4)
// _SafeStr_8905 = "_-s1B" (String#32214, DoABC#4)


