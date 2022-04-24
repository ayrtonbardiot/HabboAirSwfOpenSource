// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs._SafeStr_3443

package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class _SafeStr_3443 extends DefaultTriggerConf 
    {


        override public function get code():int
        {
            return (_SafeStr_3412.AVATAR_SAYS_SOMETHING);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(((getMeRadio(_arg_1).isSelected) ? 1 : 0));
            return (_local_2);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return (getInput(_arg_1).text);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _arg_1.findChildByName("me_txt").caption = _arg_2.userName;
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getInput(_arg_1).text = _arg_2.stringParam;
            if (((_arg_2.intParams.length > 0) && (_arg_2.intParams[0] == 1)))
            {
                getSelector(_arg_1).setSelected(getMeRadio(_arg_1));
            }
            else
            {
                getSelector(_arg_1).setSelected(getAnyAvatarRadio(_arg_1));
            };
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("chat_txt")));
        }

        private function getAnyAvatarRadio(_arg_1:_SafeStr_3133):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName("any_avatar_radio")));
        }

        private function getMeRadio(_arg_1:_SafeStr_3133):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName("me_radio")));
        }

        private function getSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("avatar_radio")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3412 = "_-k1K" (String#4209, DoABC#4)
// _SafeStr_3443 = "_-v1t" (String#14151, DoABC#4)


