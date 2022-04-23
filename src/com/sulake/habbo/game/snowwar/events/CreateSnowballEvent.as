// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.events.CreateSnowballEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class CreateSnowballEvent extends _SafeStr_3329 
    {

        private var _snowBallGameObject:SnowBallGameObject;
        private var _SafeStr_6591:HumanGameObject;
        private var _SafeStr_6637:int;
        private var _SafeStr_6638:int;
        private var _SafeStr_6248:int;

        public function CreateSnowballEvent(_arg_1:int, _arg_2:HumanGameObject, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._snowBallGameObject = new SnowBallGameObject(_arg_1);
            this._SafeStr_6591 = _arg_2;
            this._SafeStr_6637 = _arg_3;
            this._SafeStr_6638 = _arg_4;
            this._SafeStr_6248 = _arg_5;
        }

        override public function dispose():void
        {
            super.dispose();
            _snowBallGameObject = null;
            _SafeStr_6591 = null;
        }

        public function set snowBallGameObject(_arg_1:SnowBallGameObject):void
        {
            this._snowBallGameObject = _arg_1;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            _arg_1.addGameObject(_snowBallGameObject.gameObjectId, _snowBallGameObject);
            _snowBallGameObject.isActive = true;
            var _local_2:int = _SafeStr_6591.currentLocation.x;
            var _local_3:int = _SafeStr_6591.currentLocation.y;
            var _local_4:* = 3000;
            _snowBallGameObject.initialize(_local_2, _local_3, _local_4, _SafeStr_6248, _SafeStr_6637, _SafeStr_6638, _SafeStr_6591);
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_6248 = "_-E1U" (String#2585, DoABC#4)
// _SafeStr_6591 = "_-jM" (String#2167, DoABC#4)
// _SafeStr_6637 = "_-K11" (String#13173, DoABC#4)
// _SafeStr_6638 = "_-kM" (String#13429, DoABC#4)


