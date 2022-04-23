// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3415

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class _SafeStr_3415 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.ACTOR_IS_WEARING_BADGE);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_ACTOR_IS_WEARING_BADGE);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return (getInput(_arg_1).text);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getInput(_arg_1).text = _arg_2.stringParam;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("badge_code")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3415 = "_-g17" (String#15785, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


