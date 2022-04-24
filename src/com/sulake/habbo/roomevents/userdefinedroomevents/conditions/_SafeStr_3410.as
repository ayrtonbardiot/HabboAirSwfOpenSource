// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3410

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class _SafeStr_3410 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.ACTOR_IS_WEARING_EFFECT);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488._SafeStr_6599);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getInput(_arg_1).text);
            return (_local_2);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getInput(_arg_1).text = _arg_2.intParams[0];
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("effect_id")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3410 = "_-s1G" (String#15760, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)
// _SafeStr_6599 = "_-o1O" (String#29665, DoABC#4)


