// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.Tile;
    import com.sulake.habbo.game.snowwar.utils.Location3D;
    import com.sulake.habbo.game.snowwar.utils.Direction8;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import _-kg.HumanGameObjectData;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3442;
    import com.sulake.habbo.game.snowwar._SafeStr_3352;
    import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;

    public class HumanGameObject extends SnowWarGameObject 
    {

        public static const _SafeStr_8593:int = 534;
        public static const INITIAL_SNOWBALL_COUNT:int = 5;
        public static const MAXIMUM_SNOWBALL_COUNT:int = 5;
        public static const INITIAL_HIT_POINTS:int = 5;
        public static const SNOWBALL_CREATE_TIME:int = 20;
        public static const STUN_TIME:int = 100;
        public static const INVINCIBLE_AFTER_STUN_TIME:int = 60;
        public static const ACTIVITY_STATE_NORMAL:int = 0;
        public static const ACTIVITY_STATE_MAKING_SNOWBALL:int = 1;
        public static const ACTIVITY_STATE_STUNNED:int = 2;
        public static const ACTIVITY_STATE_INVINCIBLE_AFTER_STUN:int = 3;
        public static const SNOWBALL_THROW_INTERVAL:int = 5;
        public static const BOUNDING_DATA:Array = [1600];
        public static const PLAYER_HEIGHT:int = 5000;
        private static const SCORE_ON_KNOCK_DOWN:int = 5;
        private static const SCORE_ON_HIT:int = 1;

        private var _SafeStr_6371:Tile;
        private var _SafeStr_6372:Tile;
        private var _SafeStr_6382:Boolean;
        private var _currentLocation:Location3D = new Location3D(0, 0, 0);
        private var _SafeStr_6370:Location3D = new Location3D(0, 0, 0);
        private var _bodyDirection:Direction8 = Direction8.SE;
        private var _hitPoints:int;
        private var _SafeStr_6375:int;
        protected var _SafeStr_6376:int;
        private var _SafeStr_6377:int;
        private var _SafeStr_6374:int;
        private var _SafeStr_5367:int;
        private var _SafeStr_6378:int;
        private var _SafeStr_6380:int;
        private var _name:String;
        private var _mission:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_6381:String;
        private var _SafeStr_4128:int;
        private var _SafeStr_6373:int = 0;
        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_6379:_SafeStr_24;

        public function HumanGameObject(_arg_1:_SafeStr_3310, _arg_2:HumanGameObjectData, _arg_3:Boolean, _arg_4:SnowWarEngine)
        {
            super(_arg_2.id, _arg_3);
            _SafeStr_6381 = _arg_2.sex;
            _name = _arg_2.name;
            _mission = _arg_2.mission;
            _SafeStr_3819 = _arg_2.figure;
            _SafeStr_6378 = _arg_2.team;
            _SafeStr_4128 = _arg_2.userId;
            _SafeStr_6374 = _arg_2.activityState;
            _SafeStr_6377 = _arg_2.activityTimer;
            _currentLocation.change2DLocation(_arg_2.currentLocationX, _arg_2.currentLocationY);
            _bodyDirection = Direction8.getDirection8(_arg_2.bodyDirection);
            _hitPoints = _arg_2.hitPoints;
            _SafeStr_6370.change2DLocation(_arg_2.moveTargetX, _arg_2.moveTargetY);
            _SafeStr_6375 = _arg_2.snowBallCount;
            _SafeStr_5367 = _arg_2.score;
            _SafeStr_6371 = _arg_1.getTileAt(_arg_2.currentTileX, _arg_2.currentTileY);
            _SafeStr_6371.addGameObject(this);
            var _local_5:Tile = _arg_1.getTileAt(_arg_2.nextTileX, _arg_2.nextTileY);
            if (_local_5 != _SafeStr_6371)
            {
                _SafeStr_6372 = _local_5;
                _SafeStr_6372.addGameObject(this);
                _SafeStr_6371.removeOccupyingHuman();
                _SafeStr_6382 = true;
            };
            _SafeStr_5466 = _arg_4;
            _SafeStr_6379 = new _SafeStr_24();
        }

        public function get visualizationMode():int
        {
            return (_SafeStr_6373);
        }

        public function set visualizationMode(_arg_1:int):void
        {
            _SafeStr_6373 = _arg_1;
        }

        public function get invincible():Boolean
        {
            return (_SafeStr_6374 == 3);
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_6381 = "";
            _name = "";
            _mission = "";
            _SafeStr_3819 = "";
            _SafeStr_6378 = 0;
            _SafeStr_4128 = 0;
            _currentLocation = null;
            _bodyDirection = null;
            _SafeStr_6370 = null;
            _SafeStr_6375 = 0;
            _SafeStr_5367 = 0;
            _SafeStr_6382 = false;
            _SafeStr_5466 = null;
            _SafeStr_6379 = null;
        }

        override public function get numberOfVariables():int
        {
            return (19);
        }

        override public function getVariable(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (5);
                case 1:
                    return (_SafeStr_6246);
                case 2:
                    return (_currentLocation.x);
                case 3:
                    return (_currentLocation.y);
                case 4:
                    return (_SafeStr_6371.fuseLocation[0]);
                case 5:
                    return (_SafeStr_6371.fuseLocation[1]);
                case 6:
                    return (_bodyDirection.intValue());
                case 7:
                    return (_hitPoints);
                case 8:
                    return (_SafeStr_6375);
                case 9:
                    return (_SafeStr_6376);
                case 10:
                    return (_SafeStr_6377);
                case 11:
                    return (_SafeStr_6374);
                case 12:
                    return ((_SafeStr_6372 != null) ? _SafeStr_6372.fuseLocation[0] : _SafeStr_6371.fuseLocation[0]);
                case 13:
                    return ((_SafeStr_6372 != null) ? _SafeStr_6372.fuseLocation[1] : _SafeStr_6371.fuseLocation[1]);
                case 14:
                    return (_SafeStr_6370.x);
                case 15:
                    return (_SafeStr_6370.y);
                case 16:
                    return (_SafeStr_5367);
                case 17:
                    return (_SafeStr_6378);
                case 18:
                    return (_SafeStr_4128);
                default:
                    throw (new Exception(("No such variable:" + _arg_1)));
            };
        }

        public function reinitGhost(_arg_1:HumanGameObject):void
        {
            _currentLocation.change2DLocation(_arg_1._currentLocation.x, _arg_1._currentLocation.y);
            _SafeStr_6371 = _arg_1._SafeStr_6371;
            _bodyDirection = _arg_1._bodyDirection;
            _hitPoints = _arg_1._hitPoints;
            _SafeStr_6375 = _arg_1._SafeStr_6375;
            _SafeStr_6376 = _arg_1._SafeStr_6376;
            _SafeStr_6377 = _arg_1._SafeStr_6377;
            _SafeStr_6374 = _arg_1._SafeStr_6374;
            _SafeStr_6372 = _arg_1._SafeStr_6372;
            _SafeStr_6370.change2DLocation(_arg_1._SafeStr_6370.x, _arg_1._SafeStr_6370.y);
            _SafeStr_5367 = _arg_1._SafeStr_5367;
            _SafeStr_6378 = _arg_1._SafeStr_6378;
            _SafeStr_4128 = _arg_1._SafeStr_4128;
        }

        public function isInGhostDistance(_arg_1:int, _arg_2:Location3D):Boolean
        {
            var _local_3:Location3D = _SafeStr_6379[_arg_1];
            if (_local_3)
            {
                return (_local_3.isInDistance(_arg_2, Tile.TILE_ONEANDHALFWIDTH));
            };
            return (false);
        }

        public function addGhostLocation(_arg_1:int):void
        {
            var _local_2:Location3D = new Location3D(0, 0, 0);
            _local_2.change2DLocation(_currentLocation.x, _currentLocation.y);
            _SafeStr_6379[_arg_1] = _local_2;
        }

        public function removeGhostLocation(_arg_1:int):void
        {
            _SafeStr_6379.remove(_arg_1);
        }

        public function setBodyDirection(_arg_1:Direction8):void
        {
            _bodyDirection = _arg_1;
        }

        override public function get boundingType():int
        {
            return (2);
        }

        override public function get boundingData():Array
        {
            return (BOUNDING_DATA);
        }

        override public function get location3D():Location3D
        {
            return (_currentLocation);
        }

        override public function get direction360():Direction360
        {
            return (null);
        }

        override public function onRemove():void
        {
            if (((_SafeStr_6371) && (_SafeStr_6371.occupyingHuman == this)))
            {
                _SafeStr_6371.removeOccupyingHuman();
            };
            if (((_SafeStr_6372) && (_SafeStr_6372.occupyingHuman == this)))
            {
                _SafeStr_6372.removeOccupyingHuman();
            };
            _SafeStr_6382 = false;
        }

        public function activityTimerTriggered():void
        {
            if (_SafeStr_6374 == 2)
            {
                _hitPoints = 5;
                _SafeStr_6374 = 3;
                _SafeStr_6377 = 60;
                return;
            };
            if (_SafeStr_6374 == 1)
            {
                _SafeStr_6375++;
            };
            _SafeStr_6374 = 0;
            _SafeStr_5466.stopWaitingForSnowball(gameObjectId);
        }

        override public function subturn(_arg_1:_SafeStr_3309):void
        {
            var _local_2:int;
            var _local_3:* = null;
            var _local_4:_SafeStr_3310 = (_arg_1 as _SafeStr_3310);
            if (_SafeStr_6377 > 0)
            {
                if (_SafeStr_6377 == 1)
                {
                    activityTimerTriggered();
                };
                _SafeStr_6377--;
            };
            if (_SafeStr_6380 > 0)
            {
                _SafeStr_6380--;
            };
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((gameObjectId + " currentTile:") + _SafeStr_6371) + " nextTile:") + _SafeStr_6372));
            };
            if (((canMove()) && (!(_SafeStr_6371 == null))))
            {
                if (_SafeStr_6372 != null)
                {
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((((gameObjectId + " Moving towards next tile:") + _SafeStr_6372) + " _currentLocation:") + _currentLocation));
                    };
                    moveTowardsNextTile();
                }
                else
                {
                    if (!_SafeStr_6371.locationIsInTileRange(_SafeStr_6370))
                    {
                        _local_2 = Direction360.getAngleFromComponents((_SafeStr_6370.x - _SafeStr_6371.location.x), (_SafeStr_6370.y - _SafeStr_6371.location.y));
                        _local_3 = Direction360.direction360ValueToDirection8(_local_2);
                        _SafeStr_6372 = _SafeStr_6371.getTileInDirection(_local_3);
                        if (((_SafeStr_6372 == null) || (!(_SafeStr_6372.canMoveTo(this)))))
                        {
                            if (((!(_SafeStr_6372 == null)) && (!(_SafeStr_6372.canMoveTo(this)))))
                            {
                                if (_SafeStr_6370.equals(_SafeStr_6372.location))
                                {
                                    _SafeStr_6372 = null;
                                    stopMovement();
                                    return;
                                };
                            };
                            _local_3 = _local_3.rotateDirection(-1);
                            _SafeStr_6372 = _SafeStr_6371.getTileInDirection(_local_3);
                            if (((_SafeStr_6372 == null) || (!(_SafeStr_6372.canMoveTo(this)))))
                            {
                                _local_3 = _local_3.rotateDirection(2);
                                _SafeStr_6372 = _SafeStr_6371.getTileInDirection(_local_3);
                                if (((!(_SafeStr_6372 == null)) && (!(_SafeStr_6372.canMoveTo(this)))))
                                {
                                    _SafeStr_6372 = null;
                                };
                            };
                        };
                        if (_SafeStr_6372 != null)
                        {
                            if (!isGhost)
                            {
                                _SafeStr_6371.removeOccupyingHuman();
                                _SafeStr_6372.addGameObject(this);
                            };
                            setBodyDirection(_local_3);
                            moveTowardsNextTile();
                        }
                        else
                        {
                            _SafeStr_6382 = false;
                        };
                        if (HabboGamesCom.logEnabled)
                        {
                            HabboGamesCom.log(((((((((gameObjectId + " Starting to move to next tile in direction360:") + _local_2) + ", nextTile is now ") + _SafeStr_6372) + "_currentLocationn:") + _currentLocation) + ", moveTarget:") + _SafeStr_6370));
                        };
                    }
                    else
                    {
                        _SafeStr_6382 = false;
                    };
                };
            }
            else
            {
                _SafeStr_6382 = false;
            };
        }

        private function moveTowardsNextTile():void
        {
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((gameObjectId + " [MoveTowardsNextTile], currentX: ") + _currentLocation.x) + " currentY: ") + _currentLocation.y));
            };
            var _local_5:int = _SafeStr_6372.location.x;
            var _local_1:int = _currentLocation.x;
            var _local_2:int = (_local_1 - _local_5);
            if (_local_2 != 0)
            {
                if (_local_2 < 0)
                {
                    if (_local_2 > -(534))
                    {
                        _local_1 = _local_5;
                    }
                    else
                    {
                        _local_1 = (_local_1 + 534);
                    };
                }
                else
                {
                    if (_local_2 < 534)
                    {
                        _local_1 = _local_5;
                    }
                    else
                    {
                        _local_1 = (_local_1 - 534);
                    };
                };
            };
            var _local_3:int = _SafeStr_6372.location.y;
            var _local_6:int = _currentLocation.y;
            var _local_4:int = (_local_6 - _local_3);
            if (_local_4 != 0)
            {
                if (_local_4 < 0)
                {
                    if (_local_4 > -(534))
                    {
                        _local_6 = _local_3;
                    }
                    else
                    {
                        _local_6 = (_local_6 + 534);
                    };
                }
                else
                {
                    if (_local_4 < 534)
                    {
                        _local_6 = _local_3;
                    }
                    else
                    {
                        _local_6 = (_local_6 - 534);
                    };
                };
            };
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((gameObjectId + " [MoveTowardsNextTile], nextX: ") + _local_1) + " nextY: ") + _local_6));
            };
            _currentLocation.change2DLocation(_local_1, _local_6);
            if (_currentLocation.distanceTo(_SafeStr_6372.location) < _SafeStr_3442.javaDiv((534 / 2)))
            {
                _SafeStr_6371 = _SafeStr_6372;
                _SafeStr_6372 = null;
            };
            _SafeStr_6382 = true;
        }

        public function changeMoveTarget(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_6374 == 1)
            {
                _SafeStr_6374 = 0;
                _SafeStr_6377 = 0;
                _SafeStr_5466.stopWaitingForSnowball(gameObjectId);
            };
            if (((_SafeStr_6374 == 0) || (_SafeStr_6374 == 3)))
            {
                _SafeStr_6370.change2DLocation(_arg_1, _arg_2);
            };
        }

        public function get currentLocation():Location3D
        {
            return (_currentLocation);
        }

        public function playerIsHitBySnowball(_arg_1:_SafeStr_3310, _arg_2:HumanGameObject, _arg_3:int):void
        {
            if (_SafeStr_6247)
            {
                return;
            };
            if (_SafeStr_6378 == _arg_2.team)
            {
                return;
            };
            if (_hitPoints > 0)
            {
                if (_hitPoints == 1)
                {
                    playerFallsDown(_arg_3);
                    _arg_2.onKnockDownHuman(_arg_1, this);
                    SnowWarEngine.playSound("HBSTG_snowwar_hit3");
                };
                _hitPoints--;
                _SafeStr_5466.registerHit(this, _arg_2);
            };
        }

        public function onHitHuman(_arg_1:_SafeStr_3310, _arg_2:HumanGameObject):void
        {
            if (((!(_arg_2.isGhost)) && ((!(team == _arg_2.team)) || (_SafeStr_3352(_arg_1.gameArena.getExtension()).isDeathMatch()))))
            {
                addScore(_arg_1.gameArena, 1);
            };
        }

        public function onKnockDownHuman(_arg_1:_SafeStr_3310, _arg_2:HumanGameObject):void
        {
            if (((!(_arg_2.isGhost)) && ((!(team == _arg_2.team)) || (_SafeStr_3352(_arg_1.gameArena.getExtension()).isDeathMatch()))))
            {
                addScore(_arg_1.gameArena, 5);
            };
        }

        public function addScore(_arg_1:SynchronizedGameArena, _arg_2:int):void
        {
            _SafeStr_5367 = (_SafeStr_5367 + _arg_2);
            _arg_1.addTeamScore(team, _arg_2);
        }

        public function playerFallsDown(_arg_1:int):void
        {
            _SafeStr_6374 = 2;
            _SafeStr_6377 = 100;
            setBodyDirection(Direction360.direction360ValueToDirection8(_arg_1).oppositeDirection());
            stopMovement();
            _SafeStr_5466.stopWaitingForSnowball(gameObjectId);
        }

        public function stopMovement():void
        {
            if (_SafeStr_6372 == null)
            {
                _SafeStr_6370.changeLocationToLocation(_SafeStr_6371.location);
                _currentLocation.changeLocationToLocation(_SafeStr_6371.location);
            }
            else
            {
                _SafeStr_6371 = _SafeStr_6372;
                _currentLocation.changeLocationToLocation(_SafeStr_6372.location);
                _SafeStr_6370.changeLocationToLocation(_SafeStr_6372.location);
                _SafeStr_6372 = null;
            };
            _SafeStr_6382 = false;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((("Stopped. dir:" + _bodyDirection) + "_currentTilee:") + _SafeStr_6371) + "_nextTilee:") + _SafeStr_6372) + "_currentLocationn:") + _currentLocation) + "_moveTargett:") + _SafeStr_6370));
            };
        }

        public function getBodyDirection():int
        {
            return (_bodyDirection.intValue());
        }

        public function canThrowSnowballs():Boolean
        {
            return (((_SafeStr_6375 > 0) && (_SafeStr_6380 < 1)) && ((_SafeStr_6374 == 0) || (_SafeStr_6374 == 3)));
        }

        public function startThrowTimer():void
        {
            _SafeStr_6380 = 5;
        }

        public function throwSnowball(_arg_1:int, _arg_2:int):Boolean
        {
            if (_SafeStr_6375 < 1)
            {
                return (false);
            };
            stopMovement();
            var _local_4:int = Direction360.getAngleFromComponents((_arg_1 - _currentLocation.x), (_arg_2 - _currentLocation.y));
            var _local_3:int = Direction360.direction360ValueToDirection8(_local_4).intValue();
            setBodyDirection(Direction8.getDirection8(_local_3));
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((((("Turning to:" + _local_3) + " 360 value:") + _local_4) + " target:") + _arg_1) + ",") + _arg_2) + " location:") + _currentLocation.x) + ",") + _currentLocation.y));
            };
            _SafeStr_6375--;
            return (true);
        }

        public function canMove():Boolean
        {
            return ((_SafeStr_6374 == 0) || (_SafeStr_6374 == 3));
        }

        public function canMakeSnowballs():Boolean
        {
            return (((_SafeStr_6374 == 0) || (_SafeStr_6374 == 3)) && ((_SafeStr_6375 < 5) || (isGhost)));
        }

        public function startMakingSnowball():void
        {
            if (canMakeSnowballs())
            {
                _SafeStr_6374 = 1;
                _SafeStr_6377 = 20;
                stopMovement();
            };
        }

        public function getRemainingSnowballCapacity():int
        {
            return (5 - _SafeStr_6375);
        }

        public function addSnowballs(_arg_1:int):void
        {
            _SafeStr_6375 = (_SafeStr_6375 + _arg_1);
        }

        public function isStunned():Boolean
        {
            return (_SafeStr_6374 == 2);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get mission():String
        {
            return (_mission);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get sex():String
        {
            return (_SafeStr_6381);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get team():int
        {
            return (_SafeStr_6378);
        }

        public function get snowballs():int
        {
            return (_SafeStr_6375);
        }

        public function get hitPoints():int
        {
            return (_hitPoints);
        }

        public function get posture():String
        {
            if (_SafeStr_6380 > 0)
            {
                return ("swthrow");
            };
            switch (_SafeStr_6374)
            {
                case 2:
                    return ("swdieback");
                case 1:
                    return ("swpick");
                default:
                    if (_SafeStr_6382)
                    {
                        return ("swrun");
                    };
                    return ("std");
            };
        }

        public function get action():String
        {
            switch (_SafeStr_6374)
            {
                case 3:
                    return ("figure_dance");
                default:
                    return ("figure_dance");
            };
        }

        public function get parameter():int
        {
            if (_SafeStr_6380 > 1)
            {
                return (1);
            };
            if (_SafeStr_6380 == 1)
            {
                return (0);
            };
            switch (_SafeStr_6374)
            {
                case 3:
                    return (1);
                default:
                    return (0);
            };
        }

        override public function testSnowBallCollision(_arg_1:SnowBallGameObject):Boolean
        {
            if ((((((!(_SafeStr_6247)) && (!(_SafeStr_6374 == 2))) && (!(_SafeStr_6374 == 3))) && (!(_arg_1.throwingHuman == this))) && (super.testSnowBallCollision(_arg_1))))
            {
                return (true);
            };
            return (false);
        }

        override public function onSnowBallHit(_arg_1:_SafeStr_3310, _arg_2:SnowBallGameObject):void
        {
            var _local_3:HumanGameObject = _arg_2.throwingHuman;
            playerIsHitBySnowball(_arg_1, _local_3, _arg_2.direction360.intValue());
            _local_3.onHitHuman(_arg_1, this);
            SnowWarEngine.playSound("HBSTG_snowwar_hit1");
        }

        override public function get collisionHeight():int
        {
            return (5000);
        }

        public function toString():String
        {
            return (((" ref:" + _SafeStr_6246) + "_name:") + _name);
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3352 = "_-32E" (String#7620, DoABC#4)
// _SafeStr_3442 = "_-2I" (String#2362, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5367 = "_-z1J" (String#3567, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_6246 = "_-y1A" (String#4929, DoABC#4)
// _SafeStr_6247 = "_-Xw" (String#12608, DoABC#4)
// _SafeStr_6370 = "_-31K" (String#3798, DoABC#4)
// _SafeStr_6371 = "_-EU" (String#2086, DoABC#4)
// _SafeStr_6372 = "_-xa" (String#1768, DoABC#4)
// _SafeStr_6373 = "_-we" (String#18414, DoABC#4)
// _SafeStr_6374 = "_-j1B" (String#2484, DoABC#4)
// _SafeStr_6375 = "_-Jv" (String#2125, DoABC#4)
// _SafeStr_6376 = "_-j1A" (String#14468, DoABC#4)
// _SafeStr_6377 = "_-61t" (String#3906, DoABC#4)
// _SafeStr_6378 = "_-41c" (String#6804, DoABC#4)
// _SafeStr_6379 = "_-FI" (String#9285, DoABC#4)
// _SafeStr_6380 = "_-aL" (String#6886, DoABC#4)
// _SafeStr_6381 = "_-51T" (String#7526, DoABC#4)
// _SafeStr_6382 = "_-81A" (String#4275, DoABC#4)
// _SafeStr_8593 = "_-o1M" (String#40353, DoABC#4)


