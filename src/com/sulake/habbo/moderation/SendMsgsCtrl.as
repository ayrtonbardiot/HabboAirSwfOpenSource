// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.SendMsgsCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import _-V1k._SafeStr_1616;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-2s._SafeStr_224;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class SendMsgsCtrl implements _SafeStr_13, ITrackedWindow 
    {

        private static const TOPIC_ID_NOT_SELECTED:int = -999;

        private var _main:ModerationManager;
        private var _SafeStr_6009:int;
        private var _targetUserName:String;
        private var _SafeStr_5996:_SafeStr_1616;
        private var _frame:_SafeStr_3263;
        private var _SafeStr_5461:_SafeStr_3269;
        private var _SafeStr_5460:ITextFieldWindow;
        private var _disposed:Boolean;
        private var _placeHolderMessage:Boolean = true;

        public function SendMsgsCtrl(_arg_1:ModerationManager, _arg_2:int, _arg_3:String, _arg_4:_SafeStr_1616)
        {
            _main = _arg_1;
            _SafeStr_6009 = _arg_2;
            _targetUserName = _arg_3;
            _SafeStr_5996 = _arg_4;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            _frame = _SafeStr_3263(_main.getXmlWindow("send_msgs"));
            _frame.caption = ("Msg To: " + _targetUserName);
            _frame.findChildByName("send_message_but").procedure = onSendMessageButton;
            _SafeStr_5460 = ITextFieldWindow(_frame.findChildByName("message_input"));
            _SafeStr_5460.procedure = onInputClick;
            _SafeStr_5461 = _SafeStr_3269(_frame.findChildByName("msgTemplatesSelect"));
            prepareMessageSelection(_SafeStr_5461);
            _SafeStr_5461.procedure = onSelectTemplate;
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            _local_1.procedure = onClose;
            _frame.visible = true;
        }

        public function getType():int
        {
            return (2);
        }

        public function getId():String
        {
            return (_targetUserName);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame);
        }

        private function prepareMessageSelection(_arg_1:_SafeStr_3269):void
        {
            _SafeStr_14.log(("MSG TEMPLATES: " + _main.initMsg.messageTemplates.length));
            _arg_1.populate(_main.initMsg.messageTemplates);
        }

        private function onSelectTemplate(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_SELECTED")
            {
                return;
            };
            var _local_3:String = _main.initMsg.messageTemplates[_SafeStr_5461.selection];
            if (_local_3 != null)
            {
                _placeHolderMessage = false;
                _SafeStr_5460.text = _local_3;
            };
        }

        private function onSendMessageButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (((_placeHolderMessage) || (_SafeStr_5460.text == "")))
            {
                _main.windowManager.alert("Alert", "You must input a message to the user", 0, onAlertClose);
                return;
            };
            _SafeStr_14.log("Sending message...");
            _main.connection.send(new _SafeStr_224(_SafeStr_6009, _SafeStr_5460.text, -999, ((_SafeStr_5996 != null) ? _SafeStr_5996.issueId : -1)));
            this.dispose();
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            dispose();
        }

        private function onInputClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_FOCUSED")
            {
                return;
            };
            if (_placeHolderMessage)
            {
                _SafeStr_5460.text = "";
                _placeHolderMessage = false;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_frame != null)
            {
                _frame.destroy();
                _frame = null;
            };
            _SafeStr_5461 = null;
            _SafeStr_5460 = null;
            _main = null;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_224 = "_-41B" (String#19570, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_5460 = "_-d1E" (String#2603, DoABC#4)
// _SafeStr_5461 = "_-F1" (String#4752, DoABC#4)
// _SafeStr_5996 = "_-Kr" (String#2988, DoABC#4)
// _SafeStr_6009 = "_-w1D" (String#4224, DoABC#4)


