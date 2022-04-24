// by nota

//com.sulake.habbo.game.snowwar.events.NewMoveTargetEvent

package com.sulake.habbo.game.snowwar.events
{
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;

    public class NewMoveTargetEvent extends _SafeStr_3329 
    {

        private var _humanGameObject:HumanGameObject;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;

        public function NewMoveTargetEvent(_arg_1:HumanGameObject, _arg_2:int, _arg_3:int)
        {
            this._humanGameObject = _arg_1;
            this._SafeStr_4050 = _arg_2;
            this._SafeStr_4051 = _arg_3;
        }

        override public function dispose():void
        {
            super.dispose();
            _humanGameObject = null;
        }

        override public function apply(_arg_1:_SafeStr_3309):void
        {
            _humanGameObject.changeMoveTarget(_SafeStr_4050, _SafeStr_4051);
        }

        public function get humanGameObject():HumanGameObject
        {
            return (_humanGameObject);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }


    }
}//package com.sulake.habbo.game.snowwar.events

// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3329 = "_-S1J" (String#4049, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)


