// by nota

//com.sulake.habbo.roomevents._SafeStr_3118

package com.sulake.habbo.roomevents
{
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import _-l12._SafeStr_736;
    import _-l12._SafeStr_968;
    import _-l12._SafeStr_975;
    import _-yL._SafeStr_528;
    import _-l12._SafeStr_457;
    import _-l12._SafeStr_319;
    import _-y1x._SafeStr_605;
    import _-l12._SafeStr_351;
    import _-l12._SafeStr_554;
    import _-Ol._SafeStr_194;
    import _-u1V._SafeStr_1078;
    import _-t14._SafeStr_783;
    import _-u1V._SafeStr_1495;
    import _-u1V._SafeStr_1076;
    import _-u1V._SafeStr_1227;
    import _-K1r._SafeStr_1185;
    import _-61T._SafeStr_1197;
    import _-u1V._SafeStr_1317;
    import _-u1V._SafeStr_1522;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 implements _SafeStr_13 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function _SafeStr_3118(_arg_1:HabboUserDefinedRoomEvents)
        {
            _roomEvents = _arg_1;
            _messageEvents = new Vector.<IMessageEvent>(0);
            var _local_2:IHabboCommunicationManager = _roomEvents.communication;
            addMessageEvent(new _SafeStr_736(onValidationError));
            addMessageEvent(new _SafeStr_968(onCondition));
            addMessageEvent(new _SafeStr_975(onSaveSuccess));
            addMessageEvent(new _SafeStr_528(onUserObject));
            addMessageEvent(new _SafeStr_457(onRewardFailed));
            addMessageEvent(new _SafeStr_319(onOpen));
            addMessageEvent(new _SafeStr_605(onRoomExit));
            addMessageEvent(new _SafeStr_351(onTrigger));
            addMessageEvent(new _SafeStr_554(onAction));
            addMessageEvent(new _SafeStr_194(onObjectRemove));
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            _messageEvents.push(_roomEvents.communication.addHabboConnectionMessageEvent(_arg_1));
        }

        private function onOpen(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1078 = (_arg_1 as _SafeStr_319).getParser();
            _roomEvents.send(new _SafeStr_783(_local_2.stuffId));
        }

        private function onTrigger(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1495 = (_arg_1 as _SafeStr_351).getParser();
            _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_local_2.def);
        }

        private function onAction(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1076 = (_arg_1 as _SafeStr_554).getParser();
            _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_local_2.def);
        }

        private function onCondition(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1227 = (_arg_1 as _SafeStr_968).getParser();
            _roomEvents.userDefinedRoomEventsCtrl.prepareForUpdate(_local_2.def);
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = (_arg_1 as _SafeStr_528).getParser();
            _roomEvents.userName = _local_2.name;
        }

        private function onRoomExit(_arg_1:IMessageEvent):void
        {
            _roomEvents.userDefinedRoomEventsCtrl.close();
        }

        private function onObjectRemove(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1197 = (_arg_1 as _SafeStr_194).getParser();
            _SafeStr_14.log(((("Received object remove event: " + _local_2.id) + ", ") + _local_2.isExpired));
            _roomEvents.userDefinedRoomEventsCtrl.stuffRemoved(_local_2.id);
        }

        private function onRewardFailed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1317 = _SafeStr_457(_arg_1).getParser();
            if (_local_2.reason == 6)
            {
                _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.title"), _roomEvents.localization.getLocalization("wiredfurni.rewardsuccess.body"), 0, null);
            }
            else
            {
                if (_local_2.reason == 7)
                {
                    _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.badgereceived.title"), _roomEvents.localization.getLocalization("wiredfurni.badgereceived.body"), 0, null);
                }
                else
                {
                    _roomEvents.windowManager.alert(_roomEvents.localization.getLocalization("wiredfurni.rewardfailed.title"), _roomEvents.localization.getLocalization(("wiredfurni.rewardfailed.reason." + _local_2.reason)), 0, null);
                };
            };
        }

        private function onValidationError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1522 = _SafeStr_736(_arg_1).getParser();
            _roomEvents.windowManager.alert("Update failed", _local_2.info, 0, null);
        }

        private function onSaveSuccess(_arg_1:IMessageEvent):void
        {
            _roomEvents.userDefinedRoomEventsCtrl.close();
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            var _local_2:IHabboCommunicationManager = _roomEvents.communication;
            if (((!(_messageEvents == null)) && (!(_local_2 == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _local_2.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            _roomEvents = null;
        }

        public function get disposed():Boolean
        {
            return (_roomEvents == null);
        }


    }
}//package com.sulake.habbo.roomevents

// _SafeStr_1076 = "_-cv" (String#31715, DoABC#4)
// _SafeStr_1078 = "_-Jo" (String#39831, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1197 = "_-121" (String#24730, DoABC#4)
// _SafeStr_1227 = "_-Vi" (String#31963, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1317 = "_-nR" (String#32113, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1495 = "_-G1U" (String#39464, DoABC#4)
// _SafeStr_1522 = "_-BH" (String#39718, DoABC#4)
// _SafeStr_194 = "_-Y1T" (String#7719, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_319 = "_-y1n" (String#23573, DoABC#4)
// _SafeStr_351 = "_-11S" (String#24719, DoABC#4)
// _SafeStr_457 = "_-TN" (String#11694, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_554 = "_-A1k" (String#26571, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_736 = "_-r1D" (String#23404, DoABC#4)
// _SafeStr_783 = "_-b1Q" (String#28815, DoABC#4)
// _SafeStr_968 = "_-a1y" (String#28059, DoABC#4)
// _SafeStr_975 = "_-QX" (String#28522, DoABC#4)


