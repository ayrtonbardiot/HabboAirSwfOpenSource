// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.utils.Location3D;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import _-kg.SnowballGameObjectData;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3442;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3437;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;
    import com.sulake.habbo.game.snowwar.Tile;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class SnowBallGameObject extends SnowWarGameObject 
    {

        public static const TRAJECTORY_QUICK_THROW:int = 0;
        public static const TRAJECTORY_SHORT_LOB:int = 1;
        public static const TRAJECTORY_LONG_LOB:int = 2;
        public static const TRAJECTORY_DEFAULT_THROW:int = 3;
        public static const THROW_VELOCITY:int = 2000;
        public static const INITIAL_HEIGHT:int = 3000;
        public static const _SafeStr_8594:Number = 0.000707213578500707;
        public static const SHORT_LOB_TIME_TO_TARGET_COEF:Number = 0.000559;
        public static const QUICK_THROW_MAX_RANGE:int = 20000;
        public static const SHORT_LOB_MAX_RANGE:int = 60000;
        public static const LONG_LOB_MAX_RANGE:int = 100000;
        public static const DEFAULT_THROW_TO_LOB_CUTOFF_RANGE:int = 42000;
        public static const _SafeStr_8595:int = 10;
        public static const SHORT_LOB_HEIGHT_SCALING_FACTOR:int = 25;
        public static const _SafeStr_8596:int = 50;
        public static const _SafeStr_8597:int = 3;
        public static const GRAVITY:int = 15;

        public static var BOUNDING_DATA:Array = [400];

        private var _location3D:Location3D = new Location3D(0, 0, 0);
        private var _movementDirection360:Direction360 = new Direction360(0);
        private var _SafeStr_6248:int;
        private var _SafeStr_6251:int;
        private var _SafeStr_6249:int;
        private var _SafeStr_6250:HumanGameObject;
        private var _parabolaOffset:int;

        public function SnowBallGameObject(_arg_1:int)
        {
            super(_arg_1, false);
        }

        override public function dispose():void
        {
            super.dispose();
            _location3D.dispose();
            _location3D = null;
            _movementDirection360.dispose();
            _movementDirection360 = null;
            _SafeStr_6248 = 0;
            _SafeStr_6251 = 0;
            _SafeStr_6249 = 0;
            _SafeStr_6250 = null;
            _parabolaOffset = 0;
        }

        public function initializeFromData(_arg_1:SnowballGameObjectData, _arg_2:HumanGameObject):void
        {
            _location3D.changeLocation(_arg_1.locationX3D, _arg_1.locationY3D, _arg_1.locationZ3D);
            _movementDirection360.setIntValue(_arg_1.movementDirection360);
            _SafeStr_6248 = _arg_1.trajectory;
            _SafeStr_6251 = _arg_1.planarVelocity;
            _SafeStr_6249 = _arg_1.timeToLive;
            _SafeStr_6250 = _arg_2;
            _parabolaOffset = _arg_1.parabolaOffset;
            _active = true;
        }

        public function initialize(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:HumanGameObject):void
        {
            var _local_10:int;
            _active = true;
            _location3D.changeLocation(_arg_1, _arg_2, _arg_3);
            _SafeStr_6248 = _arg_4;
            var _local_8:int = (_arg_5 - _arg_1);
            var _local_9:int = (_arg_6 - _arg_2);
            _local_8 = int(_SafeStr_3442.javaDiv((_local_8 / 200)));
            _local_9 = int(_SafeStr_3442.javaDiv((_local_9 / 200)));
            _movementDirection360.setIntValue(Direction360.getAngleFromComponents(_local_8, _local_9));
            _local_10 = (_SafeStr_3437.fast_sqrt(((_local_8 * _local_8) + (_local_9 * _local_9))) * 200);
            initializeTrajectory(_arg_4, _local_10);
            if (_SafeStr_6248 == 0)
            {
                _SafeStr_6249 = (20000 / 2000);
                _SafeStr_6251 = 2000;
            }
            else
            {
                if (_SafeStr_6248 == 1)
                {
                    _local_10 = Math.min(_local_10, 60000);
                    _SafeStr_6249 = (_local_10 * 0.000559);
                    _SafeStr_6251 = ((_SafeStr_6249 == 0) ? 0 : _SafeStr_3442.javaDiv((_local_10 / _SafeStr_6249)));
                }
                else
                {
                    if (_SafeStr_6248 == 2)
                    {
                        _local_10 = Math.min(_local_10, 100000);
                        _SafeStr_6249 = (_local_10 * 0.000707213578500707);
                        _SafeStr_6251 = ((_SafeStr_6249 == 0) ? 0 : _SafeStr_3442.javaDiv((_local_10 / _SafeStr_6249)));
                    };
                };
            };
            _parabolaOffset = _SafeStr_3442.javaDiv((_SafeStr_6249 / 2));
            _SafeStr_6250 = _arg_7;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((((((((((("Snowball created, id=" + _SafeStr_6246) + " ttl:") + _SafeStr_6249) + " deltaX:") + _local_8) + " deltaY:") + _local_9) + " deltaX/200:") + _SafeStr_3442.javaDiv((_local_8 / 200))) + " deltaY/200:") + _SafeStr_3442.javaDiv((_local_9 / 200))) + " deltax^2+deltay^2:") + ((_local_8 * _local_8) + (_local_9 * _local_9))) + " sqrt(deltax^2+deltay^2):") + _SafeStr_3437.fast_sqrt(((_local_8 * _local_8) + (_local_9 * _local_9)))) + " sqrt(deltax^2+deltay^2)*200:") + (_SafeStr_3437.fast_sqrt(((_local_8 * _local_8) + (_local_9 * _local_9))) * 200)));
            };
        }

        private function initializeTrajectory(_arg_1:int, _arg_2:int):void
        {
            if (_arg_1 == 3)
            {
                if (_arg_2 <= 42000)
                {
                    _SafeStr_6248 = 0;
                }
                else
                {
                    if (_arg_2 <= 60000)
                    {
                        _SafeStr_6248 = 1;
                    }
                    else
                    {
                        _SafeStr_6248 = 2;
                    };
                };
            }
            else
            {
                _SafeStr_6248 = _arg_1;
            };
        }

        override public function get numberOfVariables():int
        {
            return (11);
        }

        override public function getVariable(_arg_1:int):int
        {
            switch (_arg_1)
            {
                case 0:
                    return (1);
                case 1:
                    return (_SafeStr_6246);
                case 2:
                    return (_location3D.x);
                case 3:
                    return (_location3D.y);
                case 4:
                    return (_location3D.z);
                case 5:
                    return (_movementDirection360.intValue());
                case 6:
                    return (_SafeStr_6248);
                case 7:
                    return (_SafeStr_6249);
                case 8:
                    return ((_SafeStr_6250 == null) ? -1 : _SafeStr_6250.gameObjectId);
                case 9:
                    return (_parabolaOffset);
                case 10:
                    return (_SafeStr_6251);
                default:
                    throw (new Exception(("No such variable:" + _arg_1)));
            };
        }

        override public function get direction360():Direction360
        {
            return (_movementDirection360);
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
            return (_location3D);
        }

        override public function subturn(_arg_1:_SafeStr_3309):void
        {
            var _local_3:_SafeStr_3310 = (_arg_1 as _SafeStr_3310);
            if (!_active)
            {
                return;
            };
            _SafeStr_6249--;
            if (_SafeStr_6248 == 0)
            {
                updatePosition(10, true);
            }
            else
            {
                if (_SafeStr_6248 == 1)
                {
                    updatePosition(25, false);
                }
                else
                {
                    updatePosition(50, false);
                };
            };
            var _local_5:int = Tile.convertToTileX(_location3D.x);
            var _local_6:int = Tile.convertToTileY(_location3D.y);
            var _local_4:Tile = _local_3.getTileAt(_local_5, _local_6);
            var _local_2:Boolean = testCollisions(_local_3, _local_4);
            if (!_local_2)
            {
                _local_2 = _local_3.testCollisionWithGround(this);
                if (_local_2)
                {
                    SnowWarEngine.playSound("HBSTG_snowwar_miss");
                };
            };
            if (_local_2)
            {
                _local_3.putGameObjectOnDeleteList(this);
            };
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((("Snowball " + _SafeStr_6246) + " tileX:") + _local_5) + " tileY:") + _local_6) + " collision:") + _local_2));
            };
        }

        private function testCollisions(_arg_1:_SafeStr_3310, _arg_2:Tile):Boolean
        {
            var _local_4:* = null;
            var _local_3:Boolean;
            if (_arg_2)
            {
                _local_3 = testCollision(_arg_1, _arg_2);
                if (!_local_3)
                {
                    _local_4 = _movementDirection360.direction8Value();
                    _local_3 = testCollision(_arg_1, _arg_2.getTileInDirection(_local_4));
                    if (!_local_3)
                    {
                        _local_3 = testCollision(_arg_1, _arg_2.getTileInDirection(_local_4.rotateDirection45Degrees(false)));
                        if (!_local_3)
                        {
                            _local_3 = testCollision(_arg_1, _arg_2.getTileInDirection(_local_4.rotateDirection45Degrees(true)));
                        };
                    };
                };
            };
            return (_local_3);
        }

        private function testCollision(_arg_1:_SafeStr_3310, _arg_2:Tile):Boolean
        {
            var _local_3:* = null;
            if (_arg_2)
            {
                _local_3 = _arg_2.gameObject;
                if (_local_3)
                {
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((("Snowball " + _SafeStr_6246) + " testing collision with ") + _local_3.gameObjectId));
                    };
                    if (_local_3.testSnowBallCollision(this))
                    {
                        _local_3.onSnowBallHit(_arg_1, this);
                        return (true);
                    };
                };
            };
            return (false);
        }

        private function updatePosition(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_6:int = int((_location3D.x + _SafeStr_3442.javaDiv(((_movementDirection360.getBaseVectorXComponent() * _SafeStr_6251) / 0xFF))));
            var _local_5:int = int((_location3D.y + _SafeStr_3442.javaDiv(((_movementDirection360.getBaseVectorYComponent() * _SafeStr_6251) / 0xFF))));
            var _local_3:int = (_SafeStr_6249 - _parabolaOffset);
            var _local_4:int = ((((_parabolaOffset * _parabolaOffset) - (_local_3 * _local_3)) * _arg_1) + 3000);
            if (_arg_2)
            {
                _local_4 = Math.min(_local_4, 3000);
            };
            _location3D.changeLocation(_local_6, _local_5, _local_4);
        }

        override public function onSnowBallHit(_arg_1:_SafeStr_3310, _arg_2:SnowBallGameObject):void
        {
        }

        public function toString():String
        {
            return ((((((((((((" location=(" + _location3D.x) + ",") + _location3D.y) + ",") + _location3D.z) + ")") + " dir=") + _movementDirection360) + " paraOffs=") + _parabolaOffset) + " ttl=") + _SafeStr_6249);
        }

        public function get throwingHuman():HumanGameObject
        {
            return (_SafeStr_6250);
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3437 = "_-Xo" (String#11596, DoABC#4)
// _SafeStr_3442 = "_-2I" (String#2362, DoABC#4)
// _SafeStr_6246 = "_-y1A" (String#4929, DoABC#4)
// _SafeStr_6248 = "_-E1U" (String#2585, DoABC#4)
// _SafeStr_6249 = "_-311" (String#3460, DoABC#4)
// _SafeStr_6250 = "_-Kg" (String#7105, DoABC#4)
// _SafeStr_6251 = "_-Q1l" (String#5242, DoABC#4)
// _SafeStr_8594 = "_-k11" (String#35697, DoABC#4)
// _SafeStr_8595 = "_-T5" (String#39575, DoABC#4)
// _SafeStr_8596 = "_-Q0" (String#39353, DoABC#4)
// _SafeStr_8597 = "_-L1g" (String#39178, DoABC#4)


