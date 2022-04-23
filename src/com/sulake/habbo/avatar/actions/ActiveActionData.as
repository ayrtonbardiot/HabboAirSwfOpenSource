// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.actions.ActiveActionData

package com.sulake.habbo.avatar.actions
{
    public class ActiveActionData implements _SafeStr_3292 
    {

        private var _SafeStr_5584:String = "";
        private var _SafeStr_5585:String = "";
        private var _definition:IActionDefinition;
        private var _startFrame:int = 0;
        private var _overridingAction:String;

        public function ActiveActionData(_arg_1:String, _arg_2:String="", _arg_3:int=0)
        {
            _SafeStr_5584 = _arg_1;
            _SafeStr_5585 = _arg_2;
            _startFrame = _arg_3;
        }

        public function get actionType():String
        {
            return (_SafeStr_5584);
        }

        public function get actionParameter():String
        {
            return (_SafeStr_5585);
        }

        public function get definition():IActionDefinition
        {
            return (_definition);
        }

        public function get id():String
        {
            if (_definition == null)
            {
                return ("");
            };
            return ((_definition.id + "_") + _SafeStr_5585);
        }

        public function set actionParameter(_arg_1:String):void
        {
            _SafeStr_5585 = _arg_1;
        }

        public function set definition(_arg_1:IActionDefinition):void
        {
            _definition = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_5584 = null;
            _SafeStr_5585 = null;
            _definition = null;
        }

        public function get startFrame():int
        {
            return (_startFrame);
        }

        public function get overridingAction():String
        {
            return (_overridingAction);
        }

        public function set overridingAction(_arg_1:String):void
        {
            _overridingAction = _arg_1;
        }

        public function toString():String
        {
            return ((("Action: " + _SafeStr_5584) + "  param: ") + _SafeStr_5585);
        }


    }
}//package com.sulake.habbo.avatar.actions

// _SafeStr_3292 = "_-91r" (String#2734, DoABC#4)
// _SafeStr_5584 = "_-zg" (String#6975, DoABC#4)
// _SafeStr_5585 = "_-u1b" (String#7778, DoABC#4)


