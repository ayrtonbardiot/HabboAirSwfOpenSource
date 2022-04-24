// by nota

//com.sulake.habbo.room._SafeStr_3127

package com.sulake.habbo.room
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import _-12m._SafeStr_910;
    import _-yL._SafeStr_528;
    import _-y1x._SafeStr_844;
    import _-Ol._SafeStr_1036;
    import _-Ol._SafeStr_730;
    import _-Ol._SafeStr_246;
    import _-Ol._SafeStr_606;
    import _-Ol._SafeStr_902;
    import _-Ol._SafeStr_413;
    import _-Ol._SafeStr_618;
    import _-Ol._SafeStr_323;
    import _-Ol._SafeStr_653;
    import _-Ol._SafeStr_314;
    import _-Ol._SafeStr_462;
    import _-Ol._SafeStr_194;
    import _-Ol._SafeStr_887;
    import _-Ol._SafeStr_885;
    import _-Ol._SafeStr_623;
    import _-Ol._SafeStr_147;
    import _-Ol._SafeStr_634;
    import _-Ol._SafeStr_530;
    import _-Ol._SafeStr_936;
    import _-Ol._SafeStr_467;
    import _-Ol._SafeStr_327;
    import _-O1Z._SafeStr_815;
    import _-O1Z._SafeStr_305;
    import _-O1Z._SafeStr_860;
    import _-O1Z._SafeStr_132;
    import _-O1Z._SafeStr_391;
    import _-O1Z._SafeStr_931;
    import _-Ol._SafeStr_731;
    import _-Nk._SafeStr_180;
    import _-Nk._SafeStr_360;
    import _-Nk._SafeStr_445;
    import _-Nk._SafeStr_1009;
    import _-81g._SafeStr_1040;
    import _-81g._SafeStr_602;
    import _-b1c._SafeStr_510;
    import _-y1x._SafeStr_831;
    import _-y1x._SafeStr_408;
    import _-b1c._SafeStr_574;
    import _-W1K._SafeStr_516;
    import _-d1i._SafeStr_171;
    import _-d1i._SafeStr_659;
    import _-d1i._SafeStr_144;
    import _-Ol._SafeStr_325;
    import _-K1r._SafeStr_1185;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-l1n._SafeStr_1131;
    import _-j1G._SafeStr_609;
    import _-j1G._SafeStr_814;
    import _-61T._SafeStr_1324;
    import com.sulake.habbo.room.utils._SafeStr_3178;
    import _-61T._SafeStr_1256;
    import _-61T._SafeStr_1220;
    import _-61T._SafeStr_1347;
    import _-61T._SafeStr_1378;
    import com.sulake.habbo.room.utils._SafeStr_3137;
    import _-3w._SafeStr_1506;
    import _-61T._SafeStr_1342;
    import _-61T._SafeStr_1101;
    import _-Ol._SafeStr_1655;
    import _-61T._SafeStr_1292;
    import com.sulake.room.utils.Vector3d;
    import _-61T._SafeStr_1281;
    import _-61T._SafeStr_1143;
    import _-61T._SafeStr_1197;
    import flash.utils.setTimeout;
    import com.sulake.room.utils.IVector3d;
    import _-61T._SafeStr_1469;
    import _-61T._SafeStr_1523;
    import _-Ol._SafeStr_1601;
    import _-61T._SafeStr_1137;
    import _-61T._SafeStr_1235;
    import _-61T._SafeStr_1429;
    import _-61T._SafeStr_1248;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import _-61T._SafeStr_1241;
    import com.sulake.room.IRoomInstance;
    import _-Ol._SafeStr_1602;
    import _-61T._SafeStr_1148;
    import _-PB._SafeStr_1226;
    import _-81O._SafeStr_1100;
    import _-81O._SafeStr_1069;
    import _-81O._SafeStr_1515;
    import _-81O._SafeStr_1301;
    import com.sulake.habbo.session.IRoomSession;
    import _-l1Q._SafeStr_1394;
    import _-PB._SafeStr_1285;
    import _-z1k._SafeStr_1412;
    import com.sulake.habbo.room.object.data._SafeStr_1613;
    import _-z1k._SafeStr_1311;
    import _-l1n._SafeStr_1214;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1372;
    import _-61T._SafeStr_1244;
    import com.sulake.room.utils.RoomRotatingEffect;
    import com.sulake.room.utils.RoomShakingEffect;
    import com.sulake.habbo.room.events.RoomEngineZoomEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    [SecureSWF(rename="true")]
    public class _SafeStr_3127 
    {

        public static const _SafeStr_8902:int = 0;
        public static const EFFECT_ROOM_SHAKE:int = 1;
        public static const _SafeStr_8903:int = 2;
        public static const EFFECT_ROOM_DISCO:int = 3;

        private var _connection:IConnection = null;
        private var _SafeStr_4112:_SafeStr_1688 = null;
        private var _SafeStr_4111:RoomPlaneParser = null;
        private var _SafeStr_4113:_SafeStr_910 = null;
        private var _SafeStr_4115:int = -1;
        private var _initialConnection:Boolean = true;
        private var _SafeStr_8904:int = -1000000000;
        private var _SafeStr_3894:int = 0;
        private var _SafeStr_4114:Object = {};
        private var _SafeStr_4116:int = -1;
        private var _SafeStr_4117:int = -1;

        public function _SafeStr_3127(_arg_1:_SafeStr_1688)
        {
            _SafeStr_4112 = _arg_1;
            _SafeStr_4111 = new RoomPlaneParser();
            _initialConnection = true;
        }

        public function dispose():void
        {
            _connection = null;
            _SafeStr_4112 = null;
            if (_SafeStr_4111 != null)
            {
                _SafeStr_4111.dispose();
                _SafeStr_4111 = null;
            };
            _SafeStr_4113 = null;
        }

        public function setCurrentRoom(_arg_1:int):void
        {
            if (_SafeStr_3894 != 0)
            {
                if (_SafeStr_4112 != null)
                {
                    _SafeStr_4112.disposeRoom(_SafeStr_3894);
                };
            };
            _SafeStr_3894 = _arg_1;
            _SafeStr_4113 = null;
        }

        public function resetCurrentRoom():void
        {
            _SafeStr_3894 = 0;
            _SafeStr_4113 = null;
        }

        private function getRoomId(_arg_1:int):int
        {
            return (_SafeStr_3894);
        }

        public function set connection(_arg_1:IConnection):void
        {
            if (_connection != null)
            {
                return;
            };
            if (_arg_1 != null)
            {
                _connection = _arg_1;
                _arg_1.addMessageEvent(new _SafeStr_528(onOwnUserEvent));
                _arg_1.addMessageEvent(new _SafeStr_844(onRoomReady));
                _arg_1.addMessageEvent(new _SafeStr_1036(onRoomProperty));
                _arg_1.addMessageEvent(new _SafeStr_910(onEntryTileData));
                _arg_1.addMessageEvent(new _SafeStr_730(onFloorHeightMap));
                _arg_1.addMessageEvent(new _SafeStr_246(onHeightMap));
                _arg_1.addMessageEvent(new _SafeStr_606(onHeightMapUpdate));
                _arg_1.addMessageEvent(new _SafeStr_902(onRoomVisualizationSettings));
                _arg_1.addMessageEvent(new _SafeStr_413(onFurnitureAliases));
                _arg_1.addMessageEvent(new _SafeStr_618(onObjects));
                _arg_1.addMessageEvent(new _SafeStr_323(onObjectAdd));
                _arg_1.addMessageEvent(new _SafeStr_653(onObjectUpdate));
                _arg_1.addMessageEvent(new _SafeStr_314(onObjectDataUpdate));
                _arg_1.addMessageEvent(new _SafeStr_462(onObjectsDataUpdate));
                _arg_1.addMessageEvent(new _SafeStr_194(onObjectRemove));
                _arg_1.addMessageEvent(new _SafeStr_887(onItems));
                _arg_1.addMessageEvent(new _SafeStr_885(onItemAdd));
                _arg_1.addMessageEvent(new _SafeStr_623(onItemRemove));
                _arg_1.addMessageEvent(new _SafeStr_147(onItemUpdate));
                _arg_1.addMessageEvent(new _SafeStr_634(onItemDataUpdate));
                _arg_1.addMessageEvent(new _SafeStr_530(onUsers));
                _arg_1.addMessageEvent(new _SafeStr_936(onUserUpdate));
                _arg_1.addMessageEvent(new _SafeStr_467(onUserRemove));
                _arg_1.addMessageEvent(new _SafeStr_327(onUserChange));
                _arg_1.addMessageEvent(new _SafeStr_815(onExpression));
                _arg_1.addMessageEvent(new _SafeStr_305(onDance));
                _arg_1.addMessageEvent(new _SafeStr_860(onAvatarEffect));
                _arg_1.addMessageEvent(new _SafeStr_132(onAvatarSleep));
                _arg_1.addMessageEvent(new _SafeStr_391(onCarryObject));
                _arg_1.addMessageEvent(new _SafeStr_931(onUseObject));
                _arg_1.addMessageEvent(new _SafeStr_731(onSlideUpdate));
                _arg_1.addMessageEvent(new _SafeStr_180(onChat));
                _arg_1.addMessageEvent(new _SafeStr_360(onChat));
                _arg_1.addMessageEvent(new _SafeStr_445(onChat));
                _arg_1.addMessageEvent(new _SafeStr_1009(onTypingStatus));
                _arg_1.addMessageEvent(new _SafeStr_1040(onDiceValue));
                _arg_1.addMessageEvent(new _SafeStr_602(onOneWayDoorStatus));
                _arg_1.addMessageEvent(new _SafeStr_510(onPetExperience));
                _arg_1.addMessageEvent(new _SafeStr_831(onPlayingGame));
                _arg_1.addMessageEvent(new _SafeStr_408(onGamePlayerNumberValue));
                _arg_1.addMessageEvent(new _SafeStr_574(onPetFigureUpdate));
                _arg_1.addMessageEvent(new _SafeStr_516(onIgnoreResult));
                _arg_1.addMessageEvent(new _SafeStr_171(onGuideSessionStarted));
                _arg_1.addMessageEvent(new _SafeStr_659(onGuideSessionEnded));
                _arg_1.addMessageEvent(new _SafeStr_144(onGuideSessionError));
                _arg_1.addMessageEvent(new _SafeStr_325(onSpecialRoomEvent));
            };
        }

        private function onOwnUserEvent(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_528 = (_arg_1 as _SafeStr_528);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1185 = _local_2.getParser();
            if (_local_3 != null)
            {
                _SafeStr_4115 = _local_3.id;
            };
        }

        private function onRoomReady(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_844 = (_arg_1 as _SafeStr_844);
            if ((((_local_4 == null) || (_local_4.getParser() == null)) || (_arg_1.connection == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1131 = _local_4.getParser();
            if (_SafeStr_3894 != _local_2.roomId)
            {
                setCurrentRoom(_local_2.roomId);
            };
            var _local_3:String = _local_2.roomType;
            if (_SafeStr_4112 != null)
            {
                _SafeStr_4112.setWorldType(_local_2.roomId, _local_3);
            };
            if (_initialConnection)
            {
                _arg_1.connection.send(new _SafeStr_609());
                _initialConnection = false;
            }
            else
            {
                _arg_1.connection.send(new _SafeStr_814());
            };
        }

        private function onFurnitureAliases(_arg_1:IMessageEvent):void
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_3:int;
            var _local_6:int;
            var _local_4:* = null;
            var _local_7:* = null;
            if (_SafeStr_4112 != null)
            {
                _local_5 = (_arg_1 as _SafeStr_413);
                if (((_local_5 == null) || (_local_5.getParser() == null)))
                {
                    return;
                };
                _local_2 = _local_5.getParser();
                if (_local_2 != null)
                {
                    _local_3 = _local_2.aliasCount;
                    _local_6 = 0;
                    while (_local_6 < _local_3)
                    {
                        _local_4 = _local_2.getName(_local_6);
                        _local_7 = _local_2.getAlias(_local_6);
                        _SafeStr_4112.setRoomObjectAlias(_local_4, _local_7);
                        _local_6++;
                    };
                };
            };
            _arg_1.connection.send(new _SafeStr_814());
        }

        private function onHeightMap(_arg_1:IMessageEvent):void
        {
            var _local_8:int;
            var _local_7:int;
            var _local_11:Number;
            var _local_4:Boolean;
            var _local_2:Boolean;
            var _local_6:_SafeStr_246 = (_arg_1 as _SafeStr_246);
            if (((_local_6 == null) || (_local_6.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1324 = _local_6.getParser();
            var _local_10:int = _local_3.width;
            var _local_9:int = _local_3.height;
            var _local_5:_SafeStr_3178 = new _SafeStr_3178(_local_10, _local_9);
            _local_8 = 0;
            while (_local_8 < _local_9)
            {
                _local_7 = 0;
                while (_local_7 < _local_10)
                {
                    _local_11 = _local_3.getTileHeight(_local_7, _local_8);
                    _local_4 = _local_3.getStackingBlocked(_local_7, _local_8);
                    _local_2 = _local_3.isRoomTile(_local_7, _local_8);
                    _local_5.setTileHeight(_local_7, _local_8, _local_11);
                    _local_5.setStackingBlocked(_local_7, _local_8, _local_4);
                    _local_5.setIsRoomTile(_local_7, _local_8, _local_2);
                    _local_7++;
                };
                _local_8++;
            };
            _SafeStr_4112.setFurniStackingHeightMap(_SafeStr_3894, _local_5);
        }

        private function onHeightMapUpdate(_arg_1:IMessageEvent):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_4:_SafeStr_606 = (_arg_1 as _SafeStr_606);
            if (((_local_4 == null) || (_local_4.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1256 = _local_4.getParser();
            var _local_3:_SafeStr_3178 = _SafeStr_4112.getFurniStackingHeightMap(_SafeStr_3894);
            if (_local_3 == null)
            {
                return;
            };
            while (_local_2.next())
            {
                _local_5 = _local_2.x;
                _local_6 = _local_2.y;
                _local_3.setTileHeight(_local_5, _local_6, _local_2.tileHeight);
                _local_3.setStackingBlocked(_local_5, _local_6, _local_2.isStackingBlocked);
                _local_3.setIsRoomTile(_local_5, _local_6, _local_2.isRoomTile);
            };
            _SafeStr_4112.refreshTileObjectMap(_SafeStr_3894, "RoomMessageHandler.onHeightMapUpdate()");
        }

        private function onRoomVisualizationSettings(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_902 = (_arg_1 as _SafeStr_902);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1220 = _local_2.getParser();
            var _local_7:* = (!(_local_3.wallsHidden));
            var _local_5:Boolean = true;
            var _local_4:Number = _local_3.wallThicknessMultiplier;
            var _local_6:Number = _local_3.floorThicknessMultiplier;
            if (_SafeStr_4112 != null)
            {
                _SafeStr_4112.updateObjectRoomVisibilities(_SafeStr_3894, _local_7, _local_5);
                _SafeStr_4112.updateObjectRoomPlaneThicknesses(_SafeStr_3894, _local_4, _local_6);
            };
        }

        private function onRoomProperty(_arg_1:IMessageEvent):void
        {
            var _local_6:_SafeStr_1036 = (_arg_1 as _SafeStr_1036);
            if (((_local_6 == null) || (_local_6.getParser() == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1347 = _local_6.getParser();
            var _local_4:String = _local_2.floorType;
            var _local_5:String = _local_2.wallType;
            var _local_3:String = _local_2.landscapeType;
            if (_SafeStr_4112 != null)
            {
                _SafeStr_4112.updateObjectRoom(_SafeStr_3894, _local_4, _local_5, _local_3);
            };
        }

        private function onEntryTileData(_arg_1:_SafeStr_910):void
        {
            _SafeStr_4113 = _arg_1;
        }

        private function onFloorHeightMap(_arg_1:IMessageEvent):void
        {
            var _local_16:int;
            var _local_15:int;
            var _local_19:int;
            var _local_9:int;
            var _local_8:int;
            var _local_13:_SafeStr_730 = (_arg_1 as _SafeStr_730);
            if (((_local_13 == null) || (_local_13.getParser() == null)))
            {
                return;
            };
            var _local_11:_SafeStr_1378 = _local_13.getParser();
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_17:_SafeStr_3137 = _SafeStr_4112.getLegacyGeometry(_SafeStr_3894);
            if (_local_17 == null)
            {
                return;
            };
            _SafeStr_4111.reset();
            var _local_14:int = _local_11.width;
            var _local_18:int = _local_11.height;
            _SafeStr_4111.initializeTileMap(_local_14, _local_18);
            var _local_5:* = -1;
            var _local_6:* = -1;
            var _local_2:* = 0;
            var _local_10:* = 0;
            var _local_3:_SafeStr_1506;
            if (_SafeStr_4113 != null)
            {
                _local_3 = _SafeStr_4113.getParser();
            };
            var _local_12:_SafeStr_3178 = _SafeStr_4112.getFurniStackingHeightMap(_SafeStr_3894);
            if (_local_12 == null)
            {
                return;
            };
            _local_16 = 0;
            while (_local_16 < _local_18)
            {
                _local_15 = 0;
                while (_local_15 < _local_14)
                {
                    _local_19 = _local_11.getTileHeight(_local_15, _local_16);
                    if ((((((_local_16 > 0) && (_local_16 < (_local_18 - 1))) || ((_local_15 > 0) && (_local_15 < (_local_14 - 1)))) && (!(_local_19 == -110))) && ((_local_3 == null) || ((_local_15 == _local_3.x) && (_local_16 == _local_3.y)))))
                    {
                        if ((((_local_11.getTileHeight(_local_15, (_local_16 - 1)) == -110) && (_local_11.getTileHeight((_local_15 - 1), _local_16) == -110)) && (_local_11.getTileHeight(_local_15, (_local_16 + 1)) == -110)))
                        {
                            _local_5 = (_local_15 + 0.5);
                            _local_6 = _local_16;
                            _local_2 = _local_19;
                            _local_10 = 90;
                        };
                        if ((((_local_11.getTileHeight(_local_15, (_local_16 - 1)) == -110) && (_local_11.getTileHeight((_local_15 - 1), _local_16) == -110)) && (_local_11.getTileHeight((_local_15 + 1), _local_16) == -110)))
                        {
                            _local_5 = _local_15;
                            _local_6 = (_local_16 + 0.5);
                            _local_2 = _local_19;
                            _local_10 = 180;
                        };
                    };
                    _SafeStr_4111.setTileHeight(_local_15, _local_16, _local_19);
                    _local_15++;
                };
                _local_16++;
            };
            _SafeStr_4111.setTileHeight(Math.floor(_local_5), Math.floor(_local_6), _local_2);
            _SafeStr_4111.initializeFromTileData(_local_13.getParser().fixedWallsHeight);
            _SafeStr_4111.setTileHeight(Math.floor(_local_5), Math.floor(_local_6), (_local_2 + _SafeStr_4111.wallHeight));
            _local_17.scale = _local_11.scale;
            _local_17.initialize(_local_14, _local_18, _SafeStr_4111.floorHeight);
            _local_9 = (_local_11.height - 1);
            while (_local_9 >= 0)
            {
                _local_8 = (_local_11.width - 1);
                while (_local_8 >= 0)
                {
                    _local_17.setTileHeight(_local_8, _local_9, _SafeStr_4111.getTileHeight(_local_8, _local_9));
                    _local_8--;
                };
                _local_9--;
            };
            var _local_7:XML = _SafeStr_4111.getXML();
            var _local_4:XML = new (XML)((((((((("<doors><door x=" + (('"' + _local_5) + '"')) + " y=") + (('"' + _local_6) + '"')) + " z=") + (('"' + _local_2) + '"')) + " dir=") + (('"' + _local_10) + '"')) + "/></doors>"));
            _local_7.appendChild(_local_4);
            _SafeStr_4112.initializeRoom(_SafeStr_3894, _local_7);
            if (_SafeStr_4114.objectData)
            {
                addActiveObject(_SafeStr_3894, _SafeStr_4114.objectData);
                _SafeStr_4114.objectData = null;
            }
            else
            {
                _SafeStr_4114.floorReady = true;
            };
        }

        private function onObjects(_arg_1:IMessageEvent):void
        {
            var _local_6:int;
            var _local_4:* = null;
            var _local_3:_SafeStr_618 = (_arg_1 as _SafeStr_618);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1342 = _local_3.getParser();
            var _local_5:int = _local_2.getObjectCount();
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_4 = _local_2.getObject(_local_6);
                addActiveObject(_SafeStr_3894, _local_4);
                _local_6++;
            };
        }

        private function onObjectAdd(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_323 = (_arg_1 as _SafeStr_323);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1101 = _local_2.getParser();
            var _local_4:_SafeStr_1655 = _local_3.data;
            addActiveObject(_SafeStr_3894, _local_4);
        }

        private function onObjectUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_3:_SafeStr_653 = (_arg_1 as _SafeStr_653);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1292 = _local_3.getParser();
            var _local_5:_SafeStr_1655 = _local_4.data;
            if (_local_5 != null)
            {
                _local_2 = new Vector3d(_local_5.x, _local_5.y, _local_5.z);
                _local_6 = new Vector3d(_local_5.dir);
                _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_5.id, _local_2, _local_6, _local_5.state, _local_5.data, _local_5.extra);
                _SafeStr_4112.updateObjectFurnitureHeight(_SafeStr_3894, _local_5.id, _local_5.sizeZ);
                _SafeStr_4112.updateObjectFurnitureExpiryTime(_SafeStr_3894, _local_5.id, _local_5.expiryTime);
            };
        }

        private function onObjectDataUpdate(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_314 = (_arg_1 as _SafeStr_314);
            if (((_local_4 == null) || (_local_4.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1281 = _local_4.getParser();
            var _local_5:int = _local_2.id;
            var _local_6:int = _local_2.state;
            var _local_3:IStuffData = _local_2.data;
            _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_5, null, null, _local_6, _local_3);
        }

        private function onObjectsDataUpdate(_arg_1:IMessageEvent):void
        {
            var _local_6:int;
            var _local_5:* = null;
            var _local_7:int;
            var _local_8:int;
            var _local_3:* = null;
            var _local_4:_SafeStr_462 = (_arg_1 as _SafeStr_462);
            if (((_local_4 == null) || (_local_4.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1143 = _local_4.getParser();
            _local_6 = 0;
            while (_local_6 < _local_2.objectCount)
            {
                _local_5 = _local_2.getObjectData(_local_6);
                if (_local_5 != null)
                {
                    _local_7 = _local_5.id;
                    _local_8 = _local_5.state;
                    _local_3 = _local_5.data;
                    _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_7, null, null, _local_8, _local_3);
                };
                _local_6++;
            };
        }

        private function onObjectRemove(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var objectRemoveEvent:_SafeStr_194 = (event as _SafeStr_194);
            if (((objectRemoveEvent == null) || (objectRemoveEvent.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var parser:_SafeStr_1197 = objectRemoveEvent.getParser();
            var id:int = parser.id;
            var delay:int = parser.delay;
            if (delay > 0)
            {
                (setTimeout(function ():void
                {
                    _SafeStr_4112.disposeObjectFurniture(_SafeStr_3894, id, ((parser.isExpired) ? -1 : parser.pickerId), true);
                }, delay));
            }
            else
            {
                _SafeStr_4112.disposeObjectFurniture(_SafeStr_3894, id, ((parser.isExpired) ? -1 : parser.pickerId), true);
            };
        }

        private function addActiveObject(_arg_1:int, _arg_2:_SafeStr_1655):void
        {
            if (((_arg_2 == null) || (_SafeStr_4112 == null)))
            {
                return;
            };
            var _local_3:IVector3d = new Vector3d(_arg_2.x, _arg_2.y, _arg_2.z);
            var _local_4:IVector3d = new Vector3d(_arg_2.dir);
            if (_arg_2.staticClass != null)
            {
                _SafeStr_4112.addObjectFurnitureByName(_arg_1, _arg_2.id, _arg_2.staticClass, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2.extra);
            }
            else
            {
                _SafeStr_4112.addObjectFurniture(_arg_1, _arg_2.id, _arg_2.type, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2.extra, _arg_2.expiryTime, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, true, true, _arg_2.sizeZ);
            };
        }

        private function onItems(_arg_1:IMessageEvent):void
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_6:_SafeStr_887 = (_arg_1 as _SafeStr_887);
            if (((_local_6 == null) || (_local_6.getParser() == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1469 = _local_6.getParser();
            var _local_4:int = _local_2.getItemCount();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = _local_2.getItem(_local_5);
                addWallItem(_SafeStr_3894, _local_3);
                _local_5++;
            };
        }

        private function onItemAdd(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_885 = (_arg_1 as _SafeStr_885);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1523 = _local_2.getParser();
            var _local_4:_SafeStr_1601 = _local_3.data;
            if (_local_4 != null)
            {
                addWallItem(_SafeStr_3894, _local_4);
            };
        }

        private function onItemRemove(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_623 = (_arg_1 as _SafeStr_623);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1137 = _local_3.getParser();
            _SafeStr_4112.disposeObjectWallItem(_SafeStr_3894, _local_2.itemId, _local_2.pickerId);
        }

        private function onItemUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_6:_SafeStr_147 = (_arg_1 as _SafeStr_147);
            if (((_local_6 == null) || (_local_6.getParser() == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1235 = _local_6.getParser();
            var _local_7:_SafeStr_3137 = _SafeStr_4112.getLegacyGeometry(_SafeStr_3894);
            if (((_SafeStr_4112 == null) || (_local_7 == null)))
            {
                return;
            };
            var _local_4:_SafeStr_1601 = _local_3.data;
            if (_local_4 != null)
            {
                _local_2 = _local_7.getLocation(_local_4.wallX, _local_4.wallY, _local_4.localX, _local_4.localY, _local_4.dir);
                _local_5 = new Vector3d(_local_7.getDirection(_local_4.dir));
                _SafeStr_4112.updateObjectWallItem(_SafeStr_3894, _local_4.id, _local_2, _local_5, _local_4.state, _local_4.data);
                _SafeStr_4112.updateObjectWallItemExpiryTime(_SafeStr_3894, _local_4.id, _local_4.secondsToExpiration);
            };
        }

        private function onItemDataUpdate(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_634 = (_arg_1 as _SafeStr_634);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1429 = _local_3.getParser();
            _SafeStr_4112.updateObjectWallItemData(_SafeStr_3894, _local_2.id, _local_2.itemData);
        }

        private function addWallItem(_arg_1:int, _arg_2:_SafeStr_1601):void
        {
            if (((_arg_2 == null) || (_SafeStr_4112 == null)))
            {
                return;
            };
            var _local_5:_SafeStr_3137 = _SafeStr_4112.getLegacyGeometry(_arg_1);
            if (_local_5 == null)
            {
                return;
            };
            var _local_3:IVector3d;
            if (!_arg_2.isOldFormat)
            {
                _local_3 = _local_5.getLocation(_arg_2.wallX, _arg_2.wallY, _arg_2.localX, _arg_2.localY, _arg_2.dir);
            }
            else
            {
                _local_3 = _local_5.getLocationOldFormat(_arg_2.y, _arg_2.z, _arg_2.dir);
            };
            var _local_4:IVector3d = new Vector3d(_local_5.getDirection(_arg_2.dir));
            _SafeStr_4112.addObjectWallItem(_arg_1, _arg_2.id, _arg_2.type, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, _arg_2.secondsToExpiration);
        }

        private function onUsers(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_7:* = null;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_5:int;
            var _local_8:_SafeStr_530 = (_arg_1 as _SafeStr_530);
            if (((_local_8 == null) || (_local_8.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1248 = _local_8.getParser();
            _local_4 = 0;
            while (_local_4 < _local_3.getUserCount())
            {
                _local_7 = _local_3.getUser(_local_4);
                if (_local_7 != null)
                {
                    _local_2 = new Vector3d(_local_7.x, _local_7.y, _local_7.z);
                    _local_6 = new Vector3d(_local_7.dir);
                    _local_5 = _local_7.userType;
                    _SafeStr_4112.addObjectUser(_SafeStr_3894, _local_7.roomIndex, _local_2, _local_6, _local_7.dir, _local_5, _local_7.figure);
                    if (_local_7.webID == _SafeStr_4115)
                    {
                        _SafeStr_4112.setOwnUserId(_SafeStr_3894, _local_7.roomIndex);
                        _SafeStr_4112.updateObjectUserOwnUserAvatar(_SafeStr_3894, _local_7.roomIndex);
                    };
                    _SafeStr_4112.updateObjectUserFigure(_SafeStr_3894, _local_7.roomIndex, _local_7.figure, _local_7.sex, _local_7.subType, _local_7.isRiding);
                    if (RoomObjectUserTypes.getName(_local_5) == "pet")
                    {
                        if (_SafeStr_4112.getPetTypeId(_local_7.figure) == 16)
                        {
                            _SafeStr_4112.updateObjectUserPosture(_SafeStr_3894, _local_7.roomIndex, _local_7.petPosture);
                        };
                    };
                    if (_SafeStr_4112.configuration.getBoolean("avatar.ignored.bubble.enabled"))
                    {
                        _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_7.roomIndex, "figure_is_muted", _SafeStr_4112.sessionDataManager.isIgnored(_local_7.name));
                    };
                };
                _local_4++;
            };
            updateGuideMarker();
        }

        private function onUserUpdate(_arg_1:IMessageEvent):void
        {
            var _local_10:int;
            var _local_6:* = null;
            var _local_16:Number;
            var _local_3:* = null;
            var _local_11:* = null;
            var _local_13:* = null;
            var _local_18:Boolean;
            var _local_8:Boolean;
            var _local_9:* = null;
            var _local_7:* = null;
            var _local_5:Boolean;
            var _local_15:Boolean;
            var _local_2:uint;
            var _local_4:_SafeStr_936 = (_arg_1 as _SafeStr_936);
            if (((_local_4 == null) || (_local_4.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_14:_SafeStr_1241 = _local_4.getParser();
            var _local_12:IRoomInstance = _SafeStr_4112.getRoom(_SafeStr_3894);
            if (_local_12 == null)
            {
                return;
            };
            var _local_19:Number = _local_12.getNumber("room_z_scale");
            _local_10 = 0;
            while (_local_10 < _local_14.userUpdateCount)
            {
                _local_6 = _local_14.getUserUpdateData(_local_10);
                if (_local_6 != null)
                {
                    _local_16 = _local_6.localZ;
                    if (_local_19 != 0)
                    {
                        _local_16 = (_local_16 / _local_19);
                    };
                    _local_3 = new Vector3d(_local_6.x, _local_6.y, (_local_6.z + _local_16));
                    _local_11 = new Vector3d(_local_6.dir);
                    _local_13 = null;
                    if (_local_6.isMoving)
                    {
                        _local_13 = new Vector3d(_local_6.targetX, _local_6.targetY, _local_6.targetZ);
                    };
                    _SafeStr_4112.updateObjectUser(_SafeStr_3894, _local_6.id, _local_3, _local_13, _local_6.canStandUp, _local_16, _local_11, _local_6.dirHead);
                    _local_18 = true;
                    _local_8 = false;
                    _local_9 = "std";
                    _local_7 = "";
                    _SafeStr_4112.updateObjectUserFlatControl(_SafeStr_3894, _local_6.id, null);
                    _local_5 = false;
                    _local_15 = false;
                    _local_2 = _local_6.actions.length;
                    for each (var _local_17:_SafeStr_1602 in _local_6.actions)
                    {
                        switch (_local_17.actionType)
                        {
                            case "flatctrl":
                                _SafeStr_4112.updateObjectUserFlatControl(_SafeStr_3894, _local_6.id, _local_17.actionParameter);
                                break;
                            case "sign":
                                if (_local_2 == 1)
                                {
                                    _local_18 = false;
                                };
                                _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_6.id, "figure_sign", _local_17.actionParameter);
                                break;
                            case "gst":
                                if (_local_2 == 1)
                                {
                                    _local_18 = false;
                                };
                                _SafeStr_4112.updateObjectPetGesture(_SafeStr_3894, _local_6.id, _local_17.actionParameter);
                                break;
                            case "wav":
                            case "mv":
                                _local_15 = true;
                                _local_8 = true;
                                _local_9 = _local_17.actionType;
                                _local_7 = _local_17.actionParameter;
                                break;
                            case "swim":
                                _local_5 = true;
                                _local_8 = true;
                                _local_9 = _local_17.actionType;
                                _local_7 = _local_17.actionParameter;
                                break;
                            case "trd":
                                break;
                            default:
                                _local_8 = true;
                                _local_9 = _local_17.actionType;
                                _local_7 = _local_17.actionParameter;
                        };
                    };
                    if (((!(_local_15)) && (_local_5)))
                    {
                        _local_8 = true;
                        _local_9 = "float";
                    };
                    if (_local_8)
                    {
                        _SafeStr_4112.updateObjectUserPosture(_SafeStr_3894, _local_6.id, _local_9, _local_7);
                    }
                    else
                    {
                        if (_local_18)
                        {
                            _SafeStr_4112.updateObjectUserPosture(_SafeStr_3894, _local_6.id, "std", "");
                        };
                    };
                };
                _local_10++;
            };
            updateGuideMarker();
        }

        private function onUserRemove(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_467 = (_arg_1 as _SafeStr_467);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1148 = _local_3.getParser();
            _SafeStr_4112.disposeObjectUser(_SafeStr_3894, _local_2.id);
            updateGuideMarker();
        }

        private function onUserChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_327 = (_arg_1 as _SafeStr_327);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4112.updateObjectUserFigure(_SafeStr_3894, _local_2.id, _local_2.figure, _local_2.sex);
        }

        private function onPetFigureUpdate(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_574 = (_arg_1 as _SafeStr_574);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1226 = _local_3.getParser();
            _SafeStr_4112.updateObjectUserFigure(_SafeStr_3894, _local_2.roomIndex, _local_2.figureData.figureString, "", "", _local_2.isRiding);
        }

        private function onExpression(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_815 = (_arg_1 as _SafeStr_815);
            if (_local_2 == null)
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1100 = _local_2.getParser();
            if (_local_3 == null)
            {
                return;
            };
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.userId, "figure_expression", _local_3.expressionType);
        }

        private function onDance(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_305 = (_arg_1 as _SafeStr_305);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1069 = _local_2.getParser();
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.userId, "figure_dance", _local_3.danceStyle);
        }

        private function onAvatarEffect(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_860 = (_arg_1 as _SafeStr_860);
            if (((_local_3 == null) || (_local_3.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1515 = _local_3.getParser();
            _SafeStr_4112.updateObjectUserEffect(_SafeStr_3894, _local_2.userId, _local_2.effectId, _local_2.delayMilliSeconds);
        }

        private function onAvatarSleep(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_132 = (_arg_1 as _SafeStr_132);
            if (((_local_4 == null) || (_local_4.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1301 = _local_4.getParser();
            var _local_2:int = 1;
            if (!_local_3.sleeping)
            {
                _local_2 = 0;
            };
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.userId, "figure_sleep", _local_2);
        }

        private function onCarryObject(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4112 == null)
            {
                return;
            };
            if ((_arg_1 is _SafeStr_391))
            {
                _local_2 = (_arg_1 as _SafeStr_391).getParser();
                _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_2.userId, "figure_carry_object", _local_2.itemType);
            };
        }

        private function onUseObject(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4112 == null)
            {
                return;
            };
            if ((_arg_1 is _SafeStr_931))
            {
                _local_2 = (_arg_1 as _SafeStr_931).getParser();
                _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_2.userId, "figure_use_object", _local_2.itemType);
            };
        }

        private function onSlideUpdate(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_9:* = null;
            var _local_7:int;
            var _local_3:* = null;
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_6:* = null;
            if (_SafeStr_4112 == null)
            {
                return;
            };
            if ((_arg_1 is _SafeStr_731))
            {
                _local_4 = (_arg_1 as _SafeStr_731).getParser();
                _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_4.id, null, null, 1, null);
                _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_4.id, null, null, 2, null);
                _local_9 = _local_4.objectList;
                _local_7 = 0;
                while (_local_7 < _local_9.length)
                {
                    _local_3 = _local_9[_local_7];
                    if (_local_3 != null)
                    {
                        _SafeStr_4112.updateObjectFurnitureLocation(_SafeStr_3894, _local_3.id, _local_3.loc, _local_3.target);
                    };
                    _local_7++;
                };
                if (_local_4.avatar != null)
                {
                    _local_8 = _local_4.avatar;
                    _SafeStr_4112.updateObjectUser(_SafeStr_3894, _local_8.id, _local_8.loc, _local_8.target);
                    if (_SafeStr_4112)
                    {
                        _local_2 = _SafeStr_4112.getRoom(_SafeStr_3894);
                        if (_local_2)
                        {
                            _local_5 = _local_2.getObject(_local_8.id, 100);
                        };
                    };
                    if (((!(_local_5 == null)) && (!(_local_5.getType() == "monsterplant"))))
                    {
                        switch (_local_8.moveType)
                        {
                            case "mv":
                                _local_6 = "mv";
                                break;
                            case "sld":
                                _local_6 = "std";
                        };
                        _SafeStr_4112.updateObjectUserPosture(_SafeStr_3894, _local_8.id, _local_6);
                    };
                };
            };
        }

        private function onChat(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:IRoomSession = _SafeStr_4112.roomSessionManager.getSession(_SafeStr_3894);
            if ((_arg_1 is _SafeStr_180))
            {
                _local_2 = (_arg_1 as _SafeStr_180).getParser();
            }
            else
            {
                if ((_arg_1 is _SafeStr_360))
                {
                    _local_2 = (_arg_1 as _SafeStr_360).getParser();
                    if ((((_local_2) && (_local_3)) && (_local_2.userId == _local_3.ownUserRoomId)))
                    {
                        return;
                    };
                }
                else
                {
                    if ((_arg_1 is _SafeStr_445))
                    {
                        _local_2 = (_arg_1 as _SafeStr_445).getParser();
                    };
                };
            };
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4112.updateObjectUserGesture(_SafeStr_3894, _local_2.userId, _local_2.gesture);
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_2.userId, "figure_talk", Math.ceil((_local_2.text.length / 10)));
        }

        private function onTypingStatus(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1009 = (_arg_1 as _SafeStr_1009);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1394 = _local_2.getParser();
            var _local_4:int = 1;
            if (!_local_3.isTyping)
            {
                _local_4 = 0;
            };
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.userId, "figure_is_typing", _local_4);
        }

        private function onPetExperience(_arg_1:_SafeStr_510):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1285 = _arg_1.getParser();
            _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_2.petRoomIndex, "figure_gained_experience", _local_2.gainedExperience);
        }

        private function onDiceValue(_arg_1:IMessageEvent):void
        {
            var _local_5:_SafeStr_1040 = (_arg_1 as _SafeStr_1040);
            if (((_local_5 == null) || (_local_5.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1412 = _local_5.getParser();
            var _local_4:int = _local_2.id;
            var _local_6:int = _local_2.value;
            var _local_3:IStuffData = new _SafeStr_1613();
            _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_4, null, null, _local_6, _local_3);
        }

        private function onOneWayDoorStatus(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_602 = (_arg_1 as _SafeStr_602);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            };
            if (_SafeStr_4112 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1311 = _local_2.getParser();
            var _local_5:int = _local_3.id;
            var _local_6:int = _local_3.status;
            var _local_4:IStuffData = new _SafeStr_1613();
            _SafeStr_4112.updateObjectFurniture(_SafeStr_3894, _local_5, null, null, _local_6, _local_4);
        }

        private function onPlayingGame(_arg_1:_SafeStr_831):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1214 = _arg_1.getParser();
            var _local_2:Boolean = _local_3.isPlaying;
            _SafeStr_4112.setIsPlayingGame(_SafeStr_3894, _local_2);
        }

        private function onGamePlayerNumberValue(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_3:int;
            if (_SafeStr_4112 == null)
            {
                return;
            };
            if ((_arg_1 is _SafeStr_408))
            {
                _local_2 = (_arg_1 as _SafeStr_408).getParser();
                _local_3 = getRoomId(0);
                _SafeStr_4112.updateObjectUserAction(_local_3, _local_2.userId, "figure_number_value", _local_2.value);
            };
        }

        private function onIgnoreResult(_arg_1:IMessageEvent):void
        {
            if (!_SafeStr_4112.configuration.getBoolean("avatar.ignored.bubble.enabled"))
            {
                return;
            };
            var _local_2:_SafeStr_516 = (_arg_1 as _SafeStr_516);
            var _local_3:_SafeStr_3241 = _SafeStr_4112.roomSessionManager.getSession(_SafeStr_3894).userDataManager.getUserDataByName(_local_2.name);
            if (_local_3 != null)
            {
                switch (_local_2.result)
                {
                    case 1:
                    case 2:
                        _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.roomObjectId, "figure_is_muted", 1);
                        return;
                    case 3:
                        _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.roomObjectId, "figure_is_muted", 0);
                    default:
                };
            };
        }

        private function onGuideSessionStarted(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1372 = (_arg_1.parser as _SafeStr_1372);
            _SafeStr_4116 = _local_2.guideUserId;
            _SafeStr_4117 = _local_2.requesterUserId;
            updateGuideMarker();
        }

        private function onGuideSessionEnded(_arg_1:IMessageEvent):void
        {
            removeGuideMarker();
        }

        private function onGuideSessionError(_arg_1:IMessageEvent):void
        {
            removeGuideMarker();
        }

        public function onSpecialRoomEvent(_arg_1:IMessageEvent):void
        {
            var event = _arg_1;
            var eventParser:_SafeStr_1244 = (event.parser as _SafeStr_1244);
            switch (eventParser.effectId)
            {
                case 0:
                    RoomRotatingEffect.init(250, 5000);
                    RoomRotatingEffect.turnVisualizationOn();
                    return;
                case 1:
                    RoomShakingEffect.init(250, 5000);
                    RoomShakingEffect.turnVisualizationOn();
                    return;
                case 2:
                    _SafeStr_4112.roomSessionManager.events.dispatchEvent(new RoomEngineZoomEvent(_SafeStr_3894, -1, true));
                    return;
                case 3:
                    var arrayIndex:int = 0;
                    var discoColours:Array = [29371, 16731195, 16764980, 0x99FF00, 29371, 16731195, 16764980, 0x99FF00, 0];
                    var discoTimer:Timer = new Timer(1000, (discoColours.length + 1));
                    discoTimer.addEventListener("timer", function (_arg_1:TimerEvent):void
                    {
                        if (arrayIndex == discoColours.length)
                        {
                            _SafeStr_4112.updateObjectRoomColor(_SafeStr_3894, discoColours[arrayIndex++], 176, true);
                        }
                        else
                        {
                            _SafeStr_4112.updateObjectRoomColor(_SafeStr_3894, discoColours[arrayIndex++], 176, false);
                        };
                    });
                    discoTimer.start();
                default:
            };
        }

        private function updateGuideMarker():void
        {
            var _local_1:int = _SafeStr_4112.sessionDataManager.userId;
            setUserGuideStatus(_SafeStr_4116, ((_SafeStr_4117 == _local_1) ? 1 : 0));
            setUserGuideStatus(_SafeStr_4117, ((_SafeStr_4116 == _local_1) ? 2 : 0));
        }

        private function removeGuideMarker():void
        {
            setUserGuideStatus(_SafeStr_4116, 0);
            setUserGuideStatus(_SafeStr_4117, 0);
            _SafeStr_4116 = -1;
            _SafeStr_4117 = -1;
        }

        private function setUserGuideStatus(_arg_1:int, _arg_2:int):void
        {
            if (((!(_SafeStr_4112)) || (!(_SafeStr_4112.roomSessionManager))))
            {
                return;
            };
            var _local_4:IRoomSession = _SafeStr_4112.roomSessionManager.getSession(_SafeStr_3894);
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3241 = _local_4.userDataManager.getUserDataByType(_arg_1, 1);
            if (_local_3 != null)
            {
                _SafeStr_4112.updateObjectUserAction(_SafeStr_3894, _local_3.roomObjectId, "figure_guide_status", _arg_2);
            };
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_1009 = "_-91p" (String#19691, DoABC#4)
// _SafeStr_1036 = "_-01M" (String#18729, DoABC#4)
// _SafeStr_1040 = "_-Mu" (String#18950, DoABC#4)
// _SafeStr_1069 = "_-023" (String#28520, DoABC#4)
// _SafeStr_1100 = "_-ru" (String#31661, DoABC#4)
// _SafeStr_1101 = "_-g15" (String#38412, DoABC#4)
// _SafeStr_1131 = "_-k1c" (String#17697, DoABC#4)
// _SafeStr_1137 = "_-33" (String#38571, DoABC#4)
// _SafeStr_1143 = "_-tO" (String#31564, DoABC#4)
// _SafeStr_1148 = "_-w1L" (String#30259, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1197 = "_-121" (String#24730, DoABC#4)
// _SafeStr_1207 = "_-kb" (String#32161, DoABC#4)
// _SafeStr_1214 = "_-ie" (String#32501, DoABC#4)
// _SafeStr_1220 = "_-8q" (String#31042, DoABC#4)
// _SafeStr_1226 = "_-LJ" (String#30563, DoABC#4)
// _SafeStr_1235 = "_-s1I" (String#32201, DoABC#4)
// _SafeStr_1241 = "_-7r" (String#38740, DoABC#4)
// _SafeStr_1244 = "_-LC" (String#23342, DoABC#4)
// _SafeStr_1248 = "_-mE" (String#24740, DoABC#4)
// _SafeStr_1256 = "_-kE" (String#32466, DoABC#4)
// _SafeStr_1259 = "_-D1h" (String#12208, DoABC#4)
// _SafeStr_1281 = "_-51U" (String#33393, DoABC#4)
// _SafeStr_1285 = "_-q5" (String#32235, DoABC#4)
// _SafeStr_1292 = "_-P16" (String#41320, DoABC#4)
// _SafeStr_1301 = "_-v2" (String#31598, DoABC#4)
// _SafeStr_1311 = "_-tb" (String#34379, DoABC#4)
// _SafeStr_132 = "_-51L" (String#19803, DoABC#4)
// _SafeStr_1324 = "_-zy" (String#34561, DoABC#4)
// _SafeStr_1342 = "_-87" (String#38454, DoABC#4)
// _SafeStr_1347 = "_-K1i" (String#39624, DoABC#4)
// _SafeStr_1372 = "_-j1I" (String#15982, DoABC#4)
// _SafeStr_1378 = "_-B1g" (String#32098, DoABC#4)
// _SafeStr_1394 = "_-W1e" (String#36653, DoABC#4)
// _SafeStr_1412 = "_-vs" (String#34384, DoABC#4)
// _SafeStr_1413 = "_-6p" (String#38432, DoABC#4)
// _SafeStr_1426 = "_-m1J" (String#36389, DoABC#4)
// _SafeStr_1429 = "_-c7" (String#31732, DoABC#4)
// _SafeStr_144 = "_-Tm" (String#13962, DoABC#4)
// _SafeStr_1446 = "_-3Q" (String#39097, DoABC#4)
// _SafeStr_1469 = "_-q1d" (String#41038, DoABC#4)
// _SafeStr_147 = "_-N1I" (String#21345, DoABC#4)
// _SafeStr_1506 = "_-t1t" (String#23041, DoABC#4)
// _SafeStr_1515 = "_-Y1P" (String#35366, DoABC#4)
// _SafeStr_1519 = "_-Os" (String#39237, DoABC#4)
// _SafeStr_1523 = "_-i8" (String#32324, DoABC#4)
// _SafeStr_1562 = "_-d1I" (String#24717, DoABC#4)
// _SafeStr_1584 = "_-a7" (String#31193, DoABC#4)
// _SafeStr_1601 = "_-j5" (String#19089, DoABC#4)
// _SafeStr_1602 = "_-vw" (String#34380, DoABC#4)
// _SafeStr_1613 = "_-xG" (String#3181, DoABC#4)
// _SafeStr_1614 = "_-sU" (String#31609, DoABC#4)
// _SafeStr_1643 = "_-5D" (String#38467, DoABC#4)
// _SafeStr_1655 = "_-f7" (String#19008, DoABC#4)
// _SafeStr_1688 = "_-d1g" (String#11241, DoABC#4)
// _SafeStr_171 = "_-wj" (String#18575, DoABC#4)
// _SafeStr_180 = "_-F16" (String#10084, DoABC#4)
// _SafeStr_194 = "_-Y1T" (String#7719, DoABC#4)
// _SafeStr_246 = "_-71i" (String#19971, DoABC#4)
// _SafeStr_305 = "_-b1O" (String#11082, DoABC#4)
// _SafeStr_3127 = "_-ZQ" (String#12286, DoABC#4)
// _SafeStr_3137 = "_-71l" (String#4564, DoABC#4)
// _SafeStr_314 = "_-ph" (String#17872, DoABC#4)
// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_323 = "_-P6" (String#13370, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_325 = "_-Y1M" (String#30197, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_360 = "_-hg" (String#9011, DoABC#4)
// _SafeStr_3894 = "_-O9" (String#1104, DoABC#4)
// _SafeStr_391 = "_-P1G" (String#21137, DoABC#4)
// _SafeStr_408 = "_-xX" (String#18577, DoABC#4)
// _SafeStr_4111 = "_-R8" (String#1514, DoABC#4)
// _SafeStr_4112 = "_-A1h" (String#828, DoABC#4)
// _SafeStr_4113 = "_-Sb" (String#6828, DoABC#4)
// _SafeStr_4114 = "_-9N" (String#10304, DoABC#4)
// _SafeStr_4115 = "_-B1l" (String#5568, DoABC#4)
// _SafeStr_4116 = "_-vJ" (String#6534, DoABC#4)
// _SafeStr_4117 = "_-I15" (String#10044, DoABC#4)
// _SafeStr_413 = "_-Bo" (String#22637, DoABC#4)
// _SafeStr_445 = "_-C3" (String#9312, DoABC#4)
// _SafeStr_462 = "_-rh" (String#18003, DoABC#4)
// _SafeStr_467 = "_-q1q" (String#9851, DoABC#4)
// _SafeStr_510 = "_-ya" (String#24601, DoABC#4)
// _SafeStr_516 = "_-w1k" (String#10357, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_530 = "_-sr" (String#6833, DoABC#4)
// _SafeStr_574 = "_-aQ" (String#10025, DoABC#4)
// _SafeStr_602 = "_-xB" (String#18415, DoABC#4)
// _SafeStr_606 = "_-ch" (String#19125, DoABC#4)
// _SafeStr_609 = "_-Kn" (String#30476, DoABC#4)
// _SafeStr_618 = "_-dz" (String#19074, DoABC#4)
// _SafeStr_623 = "_-V1S" (String#21806, DoABC#4)
// _SafeStr_634 = "_-K1w" (String#22662, DoABC#4)
// _SafeStr_653 = "_-S1d" (String#22050, DoABC#4)
// _SafeStr_659 = "_-CY" (String#22641, DoABC#4)
// _SafeStr_730 = "_-G3" (String#7132, DoABC#4)
// _SafeStr_731 = "_-Am" (String#22598, DoABC#4)
// _SafeStr_814 = "_-om" (String#17899, DoABC#4)
// _SafeStr_815 = "_-n17" (String#20942, DoABC#4)
// _SafeStr_831 = "_-G2" (String#23791, DoABC#4)
// _SafeStr_844 = "_-9H" (String#4703, DoABC#4)
// _SafeStr_860 = "_-bF" (String#10975, DoABC#4)
// _SafeStr_885 = "_-F14" (String#18635, DoABC#4)
// _SafeStr_887 = "_-S1x" (String#21587, DoABC#4)
// _SafeStr_8902 = "_-VA" (String#39449, DoABC#4)
// _SafeStr_8903 = "_-B1E" (String#32105, DoABC#4)
// _SafeStr_8904 = "_-f16" (String#37891, DoABC#4)
// _SafeStr_902 = "_-K18" (String#6992, DoABC#4)
// _SafeStr_910 = "_-T1G" (String#9440, DoABC#4)
// _SafeStr_931 = "_-1Y" (String#22347, DoABC#4)
// _SafeStr_936 = "_-Ko" (String#18822, DoABC#4)


