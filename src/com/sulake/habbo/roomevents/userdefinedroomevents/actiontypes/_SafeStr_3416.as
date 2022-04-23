// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3416

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window.components._SafeStr_3199;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class _SafeStr_3416 extends DefaultActionType 
    {

        private static const STRING_PARAM_DELIMITER:String = "\t";

        private var _SafeStr_4147:HabboUserDefinedRoomEvents;
        private var _figureString:String;
        private var _botName:String;
        private var _window:_SafeStr_3133;


        override public function get code():int
        {
            return (_SafeStr_3485.BOT_CHANGE_FIGURE);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _SafeStr_4147 = _arg_2;
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            var _local_2:String = getInput(_arg_1, "bot_name").text;
            return ((_local_2 + "\t") + _figureString);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_3:Array = _arg_2.stringParam.split("\t");
            if (_local_3.length > 0)
            {
                _botName = _local_3[0];
            };
            if (_local_3.length > 1)
            {
                _figureString = _local_3[1];
            };
            getInput(_arg_1, "bot_name").text = _botName;
            _SafeStr_3289(_SafeStr_3199(_arg_1.findChildByName("avatar_image")).widget).figure = _figureString;
            _arg_1.findChildByName("capture_figure").procedure = captureFigureButtonProcedure;
            _window = _arg_1;
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133, _arg_2:String):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName(_arg_2)));
        }

        private function captureFigureButtonProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _figureString = _SafeStr_4147.sessionDataManager.figure;
                _SafeStr_3289(_SafeStr_3199(_window.findChildByName("avatar_image")).widget).figure = _figureString;
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3416 = "_-8A" (String#14910, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)


