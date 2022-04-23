// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.ModActionCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import _-V1k._SafeStr_1616;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-v1p._SafeStr_1638;
    import _-v1p._SafeStr_1680;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.ITextWindow;
    import _-2s._SafeStr_352;
    import _-2s._SafeStr_867;
    import _-2s._SafeStr_280;
    import _-2s._SafeStr_253;
    import _-2s._SafeStr_1020;
    import _-2s._SafeStr_374;
    import com.sulake.habbo.utils.StringUtil;
    import _-2s._SafeStr_224;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class ModActionCtrl implements _SafeStr_13, ITrackedWindow 
    {

        private static var _SafeStr_6008:Array;
        private static var _SafeStr_6011:_SafeStr_24;

        private var _main:ModerationManager;
        private var _SafeStr_6009:int;
        private var _targetUserName:String;
        private var _SafeStr_5996:_SafeStr_1616;
        private var _frame:_SafeStr_3263;
        private var _topicDropdown:_SafeStr_3269;
        private var _SafeStr_6012:Array;
        private var _actionTypeDropdown:_SafeStr_3269;
        private var _SafeStr_5460:ITextFieldWindow;
        private var _disposed:Boolean;
        private var _SafeStr_6010:UserInfoCtrl;

        public function ModActionCtrl(_arg_1:ModerationManager, _arg_2:int, _arg_3:String, _arg_4:_SafeStr_1616, _arg_5:UserInfoCtrl)
        {
            _main = _arg_1;
            _SafeStr_6009 = _arg_2;
            _targetUserName = _arg_3;
            _SafeStr_5996 = _arg_4;
            _SafeStr_6010 = _arg_5;
            if (_SafeStr_6008 == null)
            {
                _SafeStr_6008 = [];
                _SafeStr_6008.push(new ModActionDefinition(1, "Alert", 1, 1, 0));
                _SafeStr_6008.push(new ModActionDefinition(2, "Mute 1h", 2, 2, 0));
                _SafeStr_6008.push(new ModActionDefinition(3, "Ban 18h", 3, 3, 0));
                _SafeStr_6008.push(new ModActionDefinition(4, "Ban 7 days", 3, 4, 0));
                _SafeStr_6008.push(new ModActionDefinition(5, "Ban 30 days (step 1)", 3, 5, 0));
                _SafeStr_6008.push(new ModActionDefinition(7, "Ban 30 days (step 2)", 3, 7, 0));
                _SafeStr_6008.push(new ModActionDefinition(6, "Ban 100 years", 3, 6, 0));
                _SafeStr_6008.push(new ModActionDefinition(106, "Ban avatar-only 100 years", 3, 6, 0));
                _SafeStr_6008.push(new ModActionDefinition(101, "Kick", 4, 0, 0));
                _SafeStr_6008.push(new ModActionDefinition(102, "Lock trade 1 week", 5, 0, 168));
                _SafeStr_6008.push(new ModActionDefinition(104, "Lock trade permanent", 5, 0, 876000));
                _SafeStr_6008.push(new ModActionDefinition(105, "Message", 6, 0, 0));
            };
            _main.issueManager.addModActionView(_SafeStr_6009, this);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            _frame = _SafeStr_3263(_main.getXmlWindow("modact_summary"));
            _frame.caption = ("Mod action on: " + _targetUserName);
            _frame.findChildByName("custom_sanction_button").procedure = onCustomSanctionButton;
            _SafeStr_5460 = ITextFieldWindow(_frame.findChildByName("message_input"));
            _frame.findChildByName("default_sanction_button").procedure = onDefaultSanctionButton;
            _frame.findChildByName("default_sanction_button").disable();
            initializeTopicToSanctionTypeMapping();
            initializeTopicDropdown();
            initializeActionTypeDropdown();
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            _local_1.procedure = onClose;
            _frame.visible = true;
        }

        public function getType():int
        {
            return (7);
        }

        public function getId():String
        {
            return (_targetUserName);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame);
        }

        private function logEvent(_arg_1:String, _arg_2:String=""):void
        {
            if (_SafeStr_6010 != null)
            {
                _SafeStr_6010.logEvent(_arg_1, _arg_2);
            };
        }

        private function trackAction(_arg_1:String):void
        {
            if (((!(_SafeStr_6010 == null)) && (!(_SafeStr_6010.disposed))))
            {
                _SafeStr_6010.trackAction(("modAction_" + _arg_1));
            };
        }

        private function initializeTopicToSanctionTypeMapping():void
        {
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_3:int;
            var _local_4:* = null;
            var _local_1:int;
            var _local_5:int;
            if (_SafeStr_6011 == null)
            {
                _SafeStr_6011 = new _SafeStr_24();
                _local_2 = _main.getProperty("cfh.topic_id.to.sanction_type_id");
                if (_local_2 != null)
                {
                    _local_6 = _local_2.split(",");
                    _local_3 = 0;
                    while (_local_3 < _local_6.length)
                    {
                        _local_4 = _local_6[_local_3].split("=");
                        if (_local_4.length == 2)
                        {
                            _local_1 = parseInt(_local_4[0]);
                            _local_5 = parseInt(_local_4[1]);
                            _SafeStr_6011.add(_local_1, _local_5);
                        };
                        _local_3++;
                    };
                };
            };
        }

        private function initializeTopicDropdown():void
        {
            _topicDropdown = _SafeStr_3269(_frame.findChildByName("cfh_topics"));
            _topicDropdown.addEventListener("WE_SELECTED", refreshSanctionDataForSelectedTopic);
            _SafeStr_6012 = [];
            var _local_1:Array = [];
            var _local_2:int;
            for each (var _local_4:_SafeStr_1638 in _main.issueManager.getCfhTopics())
            {
                for each (var _local_3:_SafeStr_1680 in _local_4.topics)
                {
                    _local_1[_local_2] = (("${help.cfh.topic." + _local_3.id) + "}");
                    _SafeStr_6012[_local_2] = _local_3.id;
                    _local_2++;
                };
            };
            _topicDropdown.populate(_local_1);
        }

        private function refreshSanctionDataForSelectedTopic(_arg_1:_SafeStr_3116):void
        {
            var _local_4:int;
            var _local_5:int = _topicDropdown.selection;
            var _local_2:int = _SafeStr_6012[_local_5];
            var _local_3:int = _SafeStr_6011.getValue(_local_2);
            if (!_local_3)
            {
                _local_3 = _SafeStr_6011.getValue(0);
            };
            if (_local_3)
            {
                _local_4 = 0;
                while (_local_4 < _SafeStr_6008.length)
                {
                    if (_SafeStr_6008[_local_4].actionId == _local_3)
                    {
                        _actionTypeDropdown.selection = _local_4;
                        break;
                    };
                    _local_4++;
                };
            }
            else
            {
                _actionTypeDropdown.selection = -1;
            };
            _main.issueManager.requestSanctionDataForAccount(_SafeStr_6009, _local_2);
        }

        public function showDefaultSanction(_arg_1:int, _arg_2:String):void
        {
            if (((_frame == null) || (!(_arg_1 == _SafeStr_6009))))
            {
                return;
            };
            var _local_3:ITextWindow = (_frame.findChildByName("default_sanction_label") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.caption = _arg_2;
            };
            _frame.findChildByName("default_sanction_button").enable();
        }

        private function initializeActionTypeDropdown():void
        {
            _actionTypeDropdown = _SafeStr_3269(_frame.findChildByName("sanction_type"));
            var _local_1:Array = [];
            for each (var _local_2:ModActionDefinition in _SafeStr_6008)
            {
                _local_1.push(_local_2.name);
            };
            _actionTypeDropdown.populate(_local_1);
        }

        private function onDefaultSanctionButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_topicDropdown.selection < 0)
            {
                _main.windowManager.alert("Alert", "Please select a topic.", 0, onAlertClose);
                return;
            };
            _SafeStr_14.log("Giving default sanction...");
            trackAction("defaultAction");
            logEvent("action.default");
            var _local_3:int = _SafeStr_6012[_topicDropdown.selection];
            _main.connection.send(new _SafeStr_352(_SafeStr_6009, _local_3, _SafeStr_5460.text, getIssueId()));
            dispose();
        }

        private function onCustomSanctionButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_6:Boolean;
            var _local_3:int;
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_topicDropdown.selection < 0)
            {
                _main.windowManager.alert("Alert", "Please select a topic.", 0, onAlertClose);
                return;
            };
            if (_actionTypeDropdown.selection < 0)
            {
                _main.windowManager.alert("Alert", "Please select a sanction.", 0, onAlertClose);
                return;
            };
            var _local_4:int = _SafeStr_6012[_topicDropdown.selection];
            var _local_5:ModActionDefinition = _SafeStr_6008[_actionTypeDropdown.selection];
            switch (_local_5.actionType)
            {
                case 1:
                    if (!_main.initMsg.alertPermission)
                    {
                        _main.windowManager.alert("Alert", "You have insufficient permissions.", 0, onAlertClose);
                        return;
                    };
                    trackAction("sendCaution");
                    _main.connection.send(new _SafeStr_867(_SafeStr_6009, _SafeStr_5460.text, _local_4, getIssueId()));
                    break;
                case 2:
                    trackAction("mute");
                    _main.connection.send(new _SafeStr_280(_SafeStr_6009, _SafeStr_5460.text, _local_4, getIssueId()));
                    break;
                case 3:
                    if (!_main.initMsg.banPermission)
                    {
                        _main.windowManager.alert("Alert", "You have insufficient permissions.", 0, onAlertClose);
                        return;
                    };
                    trackAction("ban");
                    _local_6 = (_local_5.actionId == 106);
                    _main.connection.send(new _SafeStr_253(_SafeStr_6009, _SafeStr_5460.text, _local_4, _local_5.sanctionTypeId, _local_6, getIssueId()));
                    break;
                case 4:
                    if (!_main.initMsg.kickPermission)
                    {
                        _main.windowManager.alert("Alert", "You have insufficient permissions.", 0, onAlertClose);
                        return;
                    };
                    trackAction("kick");
                    _main.connection.send(new _SafeStr_1020(_SafeStr_6009, _SafeStr_5460.text, _local_4, getIssueId()));
                    break;
                case 5:
                    trackAction("trading_lock");
                    _local_3 = (_local_5.actionLengthHours * 60);
                    _main.connection.send(new _SafeStr_374(_SafeStr_6009, _SafeStr_5460.text, _local_3, _local_4, getIssueId()));
                    break;
                case 6:
                    if (StringUtil.isEmpty(_SafeStr_5460.text))
                    {
                        _main.windowManager.alert("Alert", "Please write a message to user.", 0, onAlertClose);
                        return;
                    };
                    trackAction("sendCaution");
                    _main.connection.send(new _SafeStr_224(_SafeStr_6009, _SafeStr_5460.text, _local_4, getIssueId()));
                default:
            };
            logEvent("action.custom", "unknown");
            dispose();
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("close");
            dispose();
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
            _topicDropdown = null;
            _SafeStr_5460 = null;
            _main.issueManager.removeModActionView(_SafeStr_6009);
            _main = null;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function getIssueId():int
        {
            return ((_SafeStr_5996 != null) ? _SafeStr_5996.issueId : -1);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_1020 = "_-IX" (String#30212, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1680 = "_-61U" (String#11416, DoABC#4)
// _SafeStr_224 = "_-41B" (String#19570, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_253 = "_-4m" (String#28679, DoABC#4)
// _SafeStr_280 = "_-5v" (String#30996, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_352 = "_-9M" (String#31112, DoABC#4)
// _SafeStr_374 = "_-XB" (String#29304, DoABC#4)
// _SafeStr_5460 = "_-d1E" (String#2603, DoABC#4)
// _SafeStr_5996 = "_-Kr" (String#2988, DoABC#4)
// _SafeStr_6008 = "_-Dz" (String#3950, DoABC#4)
// _SafeStr_6009 = "_-w1D" (String#4224, DoABC#4)
// _SafeStr_6010 = "_-Sx" (String#10052, DoABC#4)
// _SafeStr_6011 = "_-L" (String#11065, DoABC#4)
// _SafeStr_6012 = "_-y1T" (String#5842, DoABC#4)
// _SafeStr_867 = "_-J1H" (String#30671, DoABC#4)


