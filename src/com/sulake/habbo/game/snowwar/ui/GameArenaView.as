// by nota

//com.sulake.habbo.game.snowwar.ui.GameArenaView

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.habbo.game.snowwar.KeyboardControl;
    import flash.display.Stage;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.room._SafeStr_1688;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData;
    import com.sulake.habbo.game.snowwar.Tile;
    import com.sulake.room.utils.Vector3d;
    import flash.events.MouseEvent;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import flash.utils.getTimer;
    import com.sulake.habbo.game.snowwar.arena.IGameObject;
    import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowWarGameObject;
    import com.sulake.habbo.game.snowwar._SafeStr_3352;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballPileGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.TreeGameObject;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import com.sulake.habbo.game.snowwar.utils.Direction8;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.habbo.room._SafeStr_1689;
    import com.sulake.habbo.room._SafeStr_1691;
    import com.sulake.room.object.IRoomObjectController;

    public class GameArenaView implements _SafeStr_13 
    {

        private static const GAME_ROOM_ID:int = 1;
        private static const TILE_CURSOR_STATE_TEAM_1:int = 3;
        private static const TILE_CURSOR_STATE_TEAM_2:int = 2;
        private static const TILE_CURSOR_STATE_TEAM_3:int = 4;
        private static const TILE_CURSOR_STATE_TEAM_4:int = 5;
        private static const EFFECT_RED_TEAM:int = 95;
        private static const EFFECT_BLUE_TEAM:int = 96;
        private static const EFFECT_CROSSHAIR:int = 98;
        private static const SPLASH_LIFE_SPAN_TIME:int = 500;

        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_5750:Array = [];
        private var _SafeStr_5751:Array = [];
        private var _SafeStr_5752:Array = [];
        private var _SafeStr_5748:KeyboardControl;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_5749:SnowWarUI;
        private var _SafeStr_5753:Boolean;
        private var _SafeStr_4845:Stage;
        private var _SafeStr_8599:Boolean;

        public function GameArenaView(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
            _SafeStr_5466.roomEngine.addObjectUpdateCategory(202);
        }

        public function dispose():void
        {
            _SafeStr_5466.roomEngine.disposeRoom(1);
            _SafeStr_5466.roomEngine.removeObjectUpdateCategory(202);
            if (_SafeStr_5748)
            {
                _SafeStr_5748.dispose();
                _SafeStr_5748 = null;
            };
            if (_SafeStr_4845 != null)
            {
                _SafeStr_4845.removeEventListener("mouseMove", onMouseMove);
                _SafeStr_4845 = null;
            };
            _SafeStr_5466 = null;
            _SafeStr_5750 = null;
            _SafeStr_5751 = null;
            if (_SafeStr_5749)
            {
                _SafeStr_5749.dispose();
                _SafeStr_5749 = null;
            };
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function init():void
        {
            var _local_11:int;
            var _local_10:int;
            var _local_12:Number;
            var _local_1:* = null;
            var _local_5:* = null;
            var _local_13:int;
            var _local_9:* = null;
            var _local_14:int;
            var _local_6:Number;
            _SafeStr_5466.roomEngine.isGameMode = true;
            var _local_7:_SafeStr_3310 = (_SafeStr_5466.gameArena.getCurrentStage() as _SafeStr_3310);
            var _local_2:GameLevelData = _local_7.gameLevelData;
            var _local_8:Array = _local_7.getTiles();
            var _local_3:RoomPlaneParser = new RoomPlaneParser();
            _local_3.initializeTileMap(_local_2.width, _local_2.height);
            _local_11 = 0;
            while (_local_11 < _local_2.height)
            {
                _local_10 = 0;
                while (_local_10 < _local_2.width)
                {
                    _local_3.setTileHeight(_local_10, _local_11, ((_local_8[_local_11][_local_10] == null) ? -100 : 0));
                    _local_10++;
                };
                _local_11++;
            };
            _local_3.initializeFromTileData();
            _SafeStr_5466.roomEngine.initializeRoom(1, _local_3.getXML());
            (_SafeStr_5466.roomEngine as _SafeStr_1688).updateObjectRoomVisibilities(1, false);
            _local_3.dispose();
            for each (var _local_4:FuseObjectData in _local_7.gameLevelData.fuseObjects)
            {
                _local_12 = (_local_4.altitude / Tile.TILE_HALFWIDTH);
                _local_1 = new Vector3d(_local_4.x, _local_4.y, _local_12);
                _local_5 = new Vector3d((_local_4.direction * 45));
                _local_13 = _SafeStr_5466.roomEngine.getFurnitureTypeId(_local_4.name);
                _local_9 = _local_4.stuffData;
                _local_14 = 0;
                _local_6 = parseInt(_local_9.getLegacyString());
                if (!isNaN(_local_6))
                {
                    _local_14 = _local_6;
                };
                _SafeStr_5466.roomEngine.addObjectFurniture(1, _local_4.id, _local_13, _local_1, _local_5, _local_14, _local_9);
            };
            _SafeStr_5466.roomUI.visible = false;
            _SafeStr_4845 = _SafeStr_5466.context.displayObjectContainer.stage;
            _SafeStr_4845.addEventListener("mouseMove", onMouseMove);
        }

        private function onMouseMove(_arg_1:MouseEvent):void
        {
            _SafeStr_8599 = ((_arg_1.altKey) || (_arg_1.shiftKey));
        }

        public function initGameUI(_arg_1:int):void
        {
            _SafeStr_5749 = new SnowWarUI(_SafeStr_5466);
            _SafeStr_5749.init();
            initCountDown();
        }

        public function removeGameUI():void
        {
            if (_SafeStr_5749)
            {
                _SafeStr_5749.dispose();
                _SafeStr_5749 = null;
            };
        }

        public function update(_arg_1:uint, _arg_2:Boolean=false):void
        {
            var _local_11:* = null;
            var _local_25:* = null;
            var _local_16:Number;
            var _local_13:Number;
            var _local_9:int;
            var _local_18:int;
            var _local_5:int;
            var _local_17:* = null;
            var _local_22:* = null;
            var _local_21:int;
            var _local_26:*;
            var _local_7:* = null;
            var _local_4:Boolean;
            var _local_19:int;
            var _local_24:* = null;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_20:* = null;
            if (((_arg_2) && (_SafeStr_5748)))
            {
                _local_11 = _SafeStr_5748.direction;
                if (_local_11)
                {
                    _local_25 = (_SafeStr_5466.gameArena.getCurrentStage().getGameObject(_SafeStr_5466.ownId) as HumanGameObject);
                    _local_16 = (_local_25.currentLocation.x / 3200);
                    _local_13 = (_local_25.currentLocation.y / 3200);
                    _local_16 = (_local_16 + (_local_11.getUnitVectorXcomponent() * 2));
                    _local_13 = (_local_13 + (_local_11.getUnitVectorYcomponent() * 2));
                    _SafeStr_5466.moveOwnAvatarTo(_local_16, _local_13);
                };
            };
            var _local_23:int = getTimer();
            for each (var _local_12:IGameObject in _SafeStr_5466.gameArena.getCurrentStage().resetRemovedGameObjects())
            {
                _local_9 = _local_12.gameObjectId;
                _local_18 = _SafeStr_5750.indexOf(_local_9);
                if (_local_18 > -1)
                {
                    _SafeStr_5466.roomEngine.disposeObjectUser(1, _local_9);
                    _SafeStr_5750.splice(_local_18, 1);
                };
                _local_5 = _SafeStr_5751.indexOf(_local_9);
                if (_local_5 > -1)
                {
                    _local_17 = _SafeStr_5466.roomEngine.getRoomObject(1, _local_9, 201);
                    _local_22 = _local_17.getLocation();
                    _SafeStr_5466.roomEngine.disposeObjectSnowWar(1, _local_9, 201);
                    _SafeStr_5751.splice(_local_5, 1);
                    if (!ISynchronizedGameObject(_local_12).isActive)
                    {
                        _SafeStr_5466.roomEngine.addObjectSnowWar(1, _local_9, _local_22, 202);
                        _SafeStr_5752.push({
                            "id":_local_9,
                            "time":_local_23,
                            "category":202
                        });
                    };
                };
            };
            _local_21 = (_SafeStr_5752.length - 1);
            while (_local_21 > -1)
            {
                _local_26 = _SafeStr_5752[_local_21];
                if ((_local_23 - _local_26.time) >= 500)
                {
                    _SafeStr_5466.roomEngine.disposeObjectSnowWar(1, _local_26.id, _local_26.category);
                    _SafeStr_5752.splice(_local_21, 1);
                };
                _local_21--;
            };
            var _local_10:Array = _SafeStr_5466.gameArena.getCurrentStage().getGameObjects();
            var _local_15:Boolean;
            for each (var _local_3:SnowWarGameObject in _local_10)
            {
                _local_7 = (_local_3 as HumanGameObject);
                if (_local_7)
                {
                    _local_4 = (_local_7.posture == "swrun");
                    _local_15 = ((_local_15) || (_local_4));
                    updateHumanGameObject(_local_7);
                    if (_local_7.gameObjectId == _SafeStr_5466.ownId)
                    {
                        _local_19 = (_SafeStr_5466.gameArena.getExtension() as _SafeStr_3352).getPulseInterval();
                        _SafeStr_5749.timer = (_SafeStr_5466.stageLength - ((_SafeStr_5466.currentSubTurn * _local_19) / 1000));
                        _SafeStr_5749.ownScore = _local_7.score;
                        _SafeStr_5749.snowballs = _local_7.snowballs;
                        _SafeStr_5749.hitPoints = _local_7.hitPoints;
                    };
                };
                _local_24 = (_local_3 as SnowBallGameObject);
                if (_local_24)
                {
                    updateSnowballGameObject(_local_24);
                };
                _local_6 = (_local_3 as SnowballMachineGameObject);
                if (_local_6)
                {
                    updateSnowballMachineGameObject(_local_6);
                };
                _local_8 = (_local_3 as SnowballPileGameObject);
                if (_local_8)
                {
                    updateSnowballPileGameObject(_local_8);
                };
                _local_20 = (_local_3 as TreeGameObject);
                if (_local_20)
                {
                    updateTreeGameObject(_local_20);
                };
            };
            if (_SafeStr_5749)
            {
                _SafeStr_5749.update(_arg_1);
            };
            if (((_local_15) && (!(_SafeStr_5753))))
            {
                _SafeStr_5753 = true;
                SnowWarEngine.playSound("HBSTG_snowwar_walk", 2147483647);
            }
            else
            {
                if (((!(_local_15)) && (_SafeStr_5753)))
                {
                    _SafeStr_5753 = false;
                    SnowWarEngine.stopSound("HBSTG_snowwar_walk");
                };
            };
            var _local_14:HumanGameObject = _SafeStr_5466.getCurrentPlayer();
            _SafeStr_5466.roomEngine.updateObjectUserEffect(1, _local_14.gameObjectId, ((_local_14.team == 1) ? 96 : 95));
        }

        private function updateHumanGameObject(_arg_1:HumanGameObject):void
        {
            var _local_3:* = null;
            var _local_9:Boolean;
            var _local_12:* = null;
            var _local_6:Boolean;
            var _local_7:Number = (_arg_1.currentLocation.x / 3200);
            var _local_4:Number = (_arg_1.currentLocation.y / 3200);
            var _local_5:int = _arg_1.gameObjectId;
            var _local_10:int = _arg_1.getBodyDirection();
            var _local_8:int = Direction360.direction8ToDirection360Value(Direction8.getDirection8(_local_10));
            var _local_2:IVector3d = new Vector3d(_local_8, 0, 0);
            if (_SafeStr_5750.indexOf(_local_5) == -1)
            {
                _local_3 = _SafeStr_5466.avatarManager.createFigureContainer(_arg_1.figure);
                switch (_arg_1.team)
                {
                    case 1:
                        _local_3.updatePart("ch", 20000, [1]);
                        break;
                    case 2:
                        _local_3.updatePart("ch", 20001, [1]);
                        break;
                    default:
                        _local_3.updatePart("ch", 20000, [1]);
                };
                _local_3.removePart("cc");
                _SafeStr_5466.roomEngine.addObjectUser(1, _local_5, new Vector3d(_local_7, _local_4, 0), _local_2, _local_8, 1, _local_3.getFigureString());
                _SafeStr_5466.roomEngine.updateObjectUserPosture(1, _local_5, "std");
                _SafeStr_5466.roomEngine.updateObjectUserAction(1, _local_5, "figure_is_playing_game", 1);
                _SafeStr_5750.push(_local_5);
                switch (_arg_1.visualizationMode)
                {
                    case 1:
                        visualizeAsGhost(getRoomUserObject(_local_5));
                        break;
                    case 2:
                        hideVisualization(getRoomUserObject(_local_5));
                    default:
                };
            }
            else
            {
                _SafeStr_5466.roomEngine.updateObjectUser(1, _local_5, new Vector3d(_local_7, _local_4, 0), new Vector3d(_local_7, _local_4, 0), false, 0, _local_2, _local_8);
                _SafeStr_5466.roomEngine.updateObjectUserPosture(1, _local_5, _arg_1.posture);
                _local_9 = ((!(_arg_1.posture == "swdieback")) && (!(_arg_1.posture == "swdiefront")));
                _SafeStr_5466.roomEngine.updateObjectUserAction(1, _local_5, "figure_is_playing_game", _local_9);
            };
            var _local_11:IRoomObject = getRoomUserObject(_local_5);
            if (_local_11 != null)
            {
                _local_12 = (_local_11.getVisualization() as IRoomObjectSpriteVisualization);
                _local_12.getSprite(0).alpha = ((_arg_1.invincible) ? 100 : 0xFF);
                _local_6 = (!(_arg_1.team == _SafeStr_5466.getCurrentPlayer().team));
                if (_local_6)
                {
                    if (((((_SafeStr_5466.roomEngine as _SafeStr_1689).playerUnderCursor == _local_5) && (!(_arg_1.invincible))) && (!(_arg_1.isStunned()))))
                    {
                        _SafeStr_5466.roomEngine.updateObjectUserEffect(1, _local_5, 98);
                    }
                    else
                    {
                        _SafeStr_5466.roomEngine.updateObjectUserEffect(1, _local_5, 0);
                    };
                };
            };
        }

        private function updateSnowballGameObject(_arg_1:SnowBallGameObject):void
        {
            var _local_5:Number = (_arg_1.location3D.x / 3200);
            var _local_3:Number = (_arg_1.location3D.y / 3200);
            var _local_4:Number = (_arg_1.location3D.z / Tile.TILE_HALFWIDTH);
            var _local_2:Vector3d = new Vector3d(_local_5, _local_3, _local_4);
            var _local_6:int = _arg_1.gameObjectId;
            if (_SafeStr_5751.indexOf(_local_6) == -1)
            {
                _SafeStr_5466.roomEngine.addObjectSnowWar(1, _local_6, _local_2, 201);
                _SafeStr_5751.push(_local_6);
            }
            else
            {
                _SafeStr_5466.roomEngine.updateObjectSnowWar(1, _local_6, _local_2, 201);
            };
        }

        private function updateSnowballMachineGameObject(_arg_1:SnowballMachineGameObject):void
        {
            var _local_3:_SafeStr_1691 = (_SafeStr_5466.roomEngine as _SafeStr_1691);
            var _local_2:IRoomObjectController = (_local_3.getRoomObject(1, _arg_1.fuseObjectId, 10) as IRoomObjectController);
            if (_local_2.getState(0) != _arg_1.snowballCount)
            {
                _local_3.updateObjectFurniture(1, _arg_1.fuseObjectId, null, null, _arg_1.snowballCount, null);
                _local_2.setState(_arg_1.snowballCount, 0);
            };
        }

        private function updateSnowballPileGameObject(_arg_1:SnowballPileGameObject):void
        {
            var _local_3:_SafeStr_1691 = (_SafeStr_5466.roomEngine as _SafeStr_1691);
            var _local_2:IRoomObjectController = (_local_3.getRoomObject(1, _arg_1.fuseObjectId, 10) as IRoomObjectController);
            var _local_4:int = (_arg_1.maxSnowballs - _arg_1.snowballCount);
            if (((_local_2) && (!(_local_2.getState(0) == _local_4))))
            {
                _local_3.updateObjectFurniture(1, _arg_1.fuseObjectId, null, null, _local_4, null);
                _local_2.setState(_local_4, 0);
            };
        }

        private function updateTreeGameObject(_arg_1:TreeGameObject):void
        {
            var _local_3:_SafeStr_1691 = (_SafeStr_5466.roomEngine as _SafeStr_1691);
            var _local_2:IRoomObjectController = (_local_3.getRoomObject(1, _arg_1.fuseObjectId, 10) as IRoomObjectController);
            if (((_local_2) && (!(_local_2.getState(0) == _arg_1.hits))))
            {
                _local_3.updateObjectFurniture(1, _arg_1.fuseObjectId, null, null, _arg_1.hits, null);
                _local_2.setState(_arg_1.hits, 0);
            };
        }

        private function getRoomUserObject(_arg_1:int):IRoomObject
        {
            return (_SafeStr_5466.roomEngine.getRoomObject(1, _arg_1, 100));
        }

        private function visualizeAsGhost(_arg_1:IRoomObject):void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1)
            {
                _local_2 = (_arg_1.getVisualization() as IRoomObjectSpriteVisualization);
                _local_4 = 0;
                while (_local_4 < _local_2.spriteCount)
                {
                    _local_3 = _local_2.getSprite(_local_4);
                    _local_3.blendMode = "hardlight";
                    _local_4++;
                };
            };
        }

        private function hideVisualization(_arg_1:IRoomObject):void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1)
            {
                _local_2 = (_arg_1.getVisualization() as IRoomObjectSpriteVisualization);
                _local_4 = 0;
                while (_local_4 < _local_2.spriteCount)
                {
                    _local_3 = _local_2.getSprite(_local_4);
                    _local_3.visible = false;
                    _local_4++;
                };
            };
        }

        public function showChecksumError(_arg_1:uint):void
        {
            _SafeStr_5749.showChecksumError(_arg_1);
        }

        private function initCountDown():void
        {
            _SafeStr_5749.initCounter();
            _SafeStr_5749.update(1000);
        }

        public function updateTileCursor(_arg_1:int):void
        {
            var _local_2:int;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = 3;
                    break;
                case 2:
                    _local_2 = 2;
                    break;
                case 3:
                    _local_2 = 4;
                    break;
                case 4:
                    _local_2 = 5;
                    break;
                default:
                    _local_2 = 0;
            };
            _SafeStr_5466.roomEngine.setTileCursorState(1, _local_2);
        }

        public function stopWaitingForSnowball():void
        {
            if (_SafeStr_5749)
            {
                _SafeStr_5749.stopWaitingForSnowball();
            };
        }

        public function startWaitingForSnowball():void
        {
            if (_SafeStr_5749)
            {
                _SafeStr_5749.startWaitingForSnowball();
            };
        }

        public function flashOwnScore(_arg_1:Boolean):void
        {
            if (_SafeStr_5749)
            {
                _SafeStr_5749.flashOwnScore(_arg_1);
            };
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1688 = "_-d1g" (String#11241, DoABC#4)
// _SafeStr_1689 = "_-018" (String#7789, DoABC#4)
// _SafeStr_1691 = "_-l1d" (String#4426, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3352 = "_-32E" (String#7620, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4845 = "_-w1I" (String#1591, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_5748 = "_-g1m" (String#11348, DoABC#4)
// _SafeStr_5749 = "_-i1S" (String#2999, DoABC#4)
// _SafeStr_5750 = "_-BX" (String#8388, DoABC#4)
// _SafeStr_5751 = "_-vi" (String#8684, DoABC#4)
// _SafeStr_5752 = "_-T9" (String#10316, DoABC#4)
// _SafeStr_5753 = "_-G0" (String#11371, DoABC#4)
// _SafeStr_8599 = "_-cc" (String#23977, DoABC#4)


