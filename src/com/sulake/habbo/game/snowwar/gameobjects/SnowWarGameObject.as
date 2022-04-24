// by nota

//com.sulake.habbo.game.snowwar.gameobjects.SnowWarGameObject

package com.sulake.habbo.game.snowwar.gameobjects
{
    import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameObject;
    import com.sulake.habbo.game.snowwar.utils._SafeStr_3362;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import com.sulake.habbo.game.snowwar.utils.Location3D;
    import com.sulake.habbo.game.snowwar.utils.Direction360;
    import com.sulake.habbo.game.snowwar.utils.CollisionDetection;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;

    public class SnowWarGameObject implements ISynchronizedGameObject, _SafeStr_3362 
    {

        protected var _active:Boolean = false;
        protected var _SafeStr_6246:int = -1;
        protected var _SafeStr_6247:Boolean = false;
        private var _SafeStr_4036:Boolean = false;

        public function SnowWarGameObject(_arg_1:int, _arg_2:Boolean)
        {
            _SafeStr_6246 = ((_arg_2) ? -(_arg_1) : _arg_1);
            _SafeStr_6247 = _arg_2;
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get isActive():Boolean
        {
            return (_active);
        }

        public function set isActive(_arg_1:Boolean):void
        {
            this._active = _arg_1;
        }

        public function get numberOfVariables():int
        {
            return (-1);
        }

        public function getVariable(_arg_1:int):int
        {
            return (-1);
        }

        public function get gameObjectId():int
        {
            return (_SafeStr_6246);
        }

        public function set gameObjectId(_arg_1:int):void
        {
            _SafeStr_6246 = _arg_1;
        }

        public function subturn(_arg_1:_SafeStr_3309):void
        {
        }

        public function get boundingType():int
        {
            return (0);
        }

        public function get boundingData():Array
        {
            return (null);
        }

        public function get location3D():Location3D
        {
            return (null);
        }

        public function get direction360():Direction360
        {
            return (null);
        }

        public function get isGhost():Boolean
        {
            return (_SafeStr_6247);
        }

        public function get ghostObjectId():int
        {
            return (-(_SafeStr_6246 + 1));
        }

        public function onRemove():void
        {
        }

        public function get collisionHeight():int
        {
            return (boundingData[0]);
        }

        public function testSnowBallCollision(_arg_1:SnowBallGameObject):Boolean
        {
            return ((_arg_1.location3D.z < collisionHeight) && (CollisionDetection.testForObjectToObjectCollision(this, _arg_1)));
        }

        public function onSnowBallHit(_arg_1:_SafeStr_3310, _arg_2:SnowBallGameObject):void
        {
        }


    }
}//package com.sulake.habbo.game.snowwar.gameobjects

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3362 = "_-717" (String#3985, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_6246 = "_-y1A" (String#4929, DoABC#4)
// _SafeStr_6247 = "_-Xw" (String#12608, DoABC#4)


