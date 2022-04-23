// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.RoomToolCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import _-x1P._SafeStr_1640;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window._SafeStr_3133;
    import _-2s._SafeStr_635;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextWindow;
    import _-x1P._SafeStr_1662;
    import _-2s._SafeStr_693;
    import _-2s._SafeStr_776;
    import _-2s._SafeStr_855;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class RoomToolCtrl implements _SafeStr_13, ITrackedWindow 
    {

        private var _main:ModerationManager;
        private var _flatId:int;
        private var _SafeStr_3740:_SafeStr_1640;
        private var _frame:_SafeStr_3263;
        private var _SafeStr_4162:IItemListWindow;
        private var _disposed:Boolean;
        private var _SafeStr_5461:_SafeStr_3269;
        private var _SafeStr_5460:ITextFieldWindow;
        private var _includeInfo:Boolean = true;
        private var _SafeStr_5462:_SafeStr_3158;
        private var _SafeStr_5463:_SafeStr_3158;
        private var _SafeStr_5464:_SafeStr_3158;
        private var _SafeStr_5459:_SafeStr_3133;

        public function RoomToolCtrl(_arg_1:ModerationManager, _arg_2:int)
        {
            _main = _arg_1;
            _flatId = _arg_2;
        }

        public static function getLowestPoint(_arg_1:_SafeStr_3133):int
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.numChildren)
            {
                _local_4 = _arg_1.getChildAt(_local_2);
                if (_local_4.visible)
                {
                    _local_3 = Math.max(_local_3, (_local_4.y + _local_4.height));
                };
                _local_2++;
            };
            return (_local_3);
        }

        public static function moveChildrenToColumn(_arg_1:_SafeStr_3133, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:* = null;
            _local_4 = 0;
            while (_local_4 < _arg_1.numChildren)
            {
                _local_5 = _arg_1.getChildAt(_local_4);
                if ((((!(_local_5 == null)) && (_local_5.visible)) && (_local_5.height > 0)))
                {
                    _local_5.y = _arg_2;
                    _arg_2 = (_arg_2 + (_local_5.height + _arg_3));
                };
                _local_4++;
            };
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            _frame = _SafeStr_3263(_main.getXmlWindow("roomtool_frame"));
            var _local_1:IItemListWindow = (_frame.findChildByName("list_cont") as IItemListWindow);
            var _local_2:_SafeStr_3133 = (_local_1.getListItemByName("room_cont") as _SafeStr_3133);
            _SafeStr_5459 = (_local_2.findChildByName("room_data") as _SafeStr_3133);
            _local_2.removeChild(_SafeStr_5459);
            _main.messageHandler.addRoomInfoListener(this);
            _main.connection.send(new _SafeStr_635(_flatId));
            _SafeStr_14.log(("BEGINNING TO SHOW: " + _flatId));
        }

        public function getType():int
        {
            return (9);
        }

        public function getId():String
        {
            return ("" + _flatId);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame);
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            dispose();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _main.messageHandler.removeRoomEnterListener(this);
            if (_frame != null)
            {
                _frame.destroy();
                _frame = null;
            };
            if (_SafeStr_3740 != null)
            {
                _SafeStr_3740.dispose();
                _SafeStr_3740 = null;
            };
            _main = null;
            _SafeStr_4162 = null;
            _SafeStr_5461 = null;
            _SafeStr_5460 = null;
            _SafeStr_5462 = null;
            _SafeStr_5463 = null;
            _SafeStr_5464 = null;
        }

        public function onRoomChange():void
        {
            setSendButtonState("send_caution_but");
            setSendButtonState("send_message_but");
        }

        private function setSendButtonState(_arg_1:String):void
        {
            var _local_3:Boolean = ((!(_SafeStr_3740 == null)) && (_SafeStr_3740.flatId == _main.currentFlatId));
            var _local_2:_SafeStr_3122 = _SafeStr_3122(_frame.findChildByName(_arg_1));
            if (((_local_3) && (_main.initMsg.roomAlertPermission)))
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            };
        }

        public function onRoomInfo(_arg_1:_SafeStr_1640):void
        {
            if (_disposed)
            {
                return;
            };
            _SafeStr_14.log(((("GOT ROOM INFO: " + _arg_1.flatId) + ", ") + _flatId));
            if (_arg_1.flatId != _flatId)
            {
                _SafeStr_14.log(((("NOT THE SAME FLAT: " + _arg_1.flatId) + ", ") + _flatId));
                return;
            };
            _SafeStr_3740 = _arg_1;
            populate();
            _main.messageHandler.removeRoomInfoListener(this);
            _frame.visible = true;
            _main.messageHandler.addRoomEnterListener(this);
        }

        public function populate():void
        {
            _SafeStr_4162 = IItemListWindow(_frame.findChildByName("list_cont"));
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            _local_1.procedure = onClose;
            _SafeStr_5460 = ITextFieldWindow(_frame.findChildByName("message_input"));
            _SafeStr_5460.procedure = onInputClick;
            _SafeStr_5461 = _SafeStr_3269(_frame.findChildByName("msgTemplatesSelect"));
            prepareMsgSelect(_SafeStr_5461);
            _SafeStr_5461.procedure = onSelectTemplate;
            _SafeStr_5462 = _SafeStr_3158(_frame.findChildByName("kick_check"));
            _SafeStr_5463 = _SafeStr_3158(_frame.findChildByName("lock_check"));
            _SafeStr_5464 = _SafeStr_3158(_frame.findChildByName("changename_check"));
            refreshRoomData(_SafeStr_3740.room, "room_cont");
            setTxt("owner_name_txt", _SafeStr_3740.ownerName);
            setTxt("owner_in_room_txt", ((_SafeStr_3740.ownerInRoom) ? "Yes" : "No"));
            setTxt("user_count_txt", ("" + _SafeStr_3740.userCount));
            _frame.findChildByName("enter_room_but").procedure = onEnterRoom;
            _frame.findChildByName("chatlog_but").procedure = onChatlog;
            _frame.findChildByName("edit_in_hk_but").procedure = onEditInHk;
            _frame.findChildByName("send_caution_but").procedure = onSendCaution;
            _frame.findChildByName("send_message_but").procedure = onSendMessage;
            ((_main.initMsg.chatlogsPermission) ? null : _frame.findChildByName("chatlog_but").disable());
            if (!_main.initMsg.roomKickPermission)
            {
                _SafeStr_5462.disable();
            };
            _frame.findChildByName("owner_name_txt").procedure = onOwnerName;
            this.onRoomChange();
        }

        private function disposeItemFromList(_arg_1:IItemListWindow, _arg_2:_SafeStr_3109):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.removeListItem(_arg_2);
            if (_local_3 != null)
            {
                _local_3.dispose();
            };
        }

        private function refreshRoomData(_arg_1:_SafeStr_1662, _arg_2:String):void
        {
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.getListItemByName(_arg_2));
            var _local_7:_SafeStr_3133 = _SafeStr_3133(_local_6.findChildByName("room_data"));
            if (_local_7 == null)
            {
                _local_7 = (_local_6.addChild(_SafeStr_5459.clone()) as _SafeStr_3133);
            };
            if (!_arg_1.exists)
            {
                disposeItemFromList(_SafeStr_4162, _local_6);
                disposeItemFromList(_SafeStr_4162, _SafeStr_4162.getListItemByName("event_spacing"));
                return;
            };
            var _local_4:ITextWindow = ITextWindow(_local_7.findChildByName("name"));
            _local_4.caption = _arg_1.name;
            _local_4.height = (_local_4.textHeight + 5);
            var _local_3:ITextWindow = ITextWindow(_local_7.findChildByName("desc"));
            _local_3.caption = _arg_1.desc;
            _local_3.height = (_local_3.textHeight + 5);
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_local_7.findChildByName("tags_cont"));
            var _local_8:ITextWindow = ITextWindow(_local_5.findChildByName("tags_txt"));
            _local_8.caption = getTagsAsString(_arg_1.tags);
            _local_8.height = (_local_8.textHeight + 5);
            _local_5.height = _local_8.height;
            if (_arg_1.tags.length < 1)
            {
                _local_7.removeChild(_local_5);
            };
            moveChildrenToColumn(_local_7, _local_4.y, 0);
            _local_7.height = getLowestPoint(_local_7);
            _local_6.height = (_local_7.height + (2 * _local_7.y));
            _SafeStr_14.log(((((((((((("XXXX: " + _local_6.height) + ", ") + _local_7.height) + ", ") + _local_4.height) + ", ") + _local_3.height) + ", ") + _local_5.height) + ", ") + _local_8.height));
        }

        private function getTagsAsString(_arg_1:Array):String
        {
            var _local_3:* = null;
            var _local_2:String = "";
            for each (_local_3 in _arg_1)
            {
                if (_local_2 == "")
                {
                    _local_2 = _local_3;
                }
                else
                {
                    _local_2 = ((_local_2 + ", ") + _local_3);
                };
            };
            return (_local_2);
        }

        private function setTxt(_arg_1:String, _arg_2:String):void
        {
            var _local_3:ITextWindow = ITextWindow(_frame.findChildByName(_arg_1));
            _local_3.text = _arg_2;
        }

        private function onOwnerName(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.windowTracker.show(new UserInfoFrameCtrl(_main, _SafeStr_3740.ownerId), _frame, false, false, true);
        }

        private function onEnterRoom(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Enter room clicked");
            _main.goToRoom(_SafeStr_3740.flatId);
        }

        private function onChatlog(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.windowTracker.show(new ChatlogCtrl(new _SafeStr_693(0, _SafeStr_3740.flatId), _main, 4, _SafeStr_3740.flatId), _frame, false, false, true);
        }

        private function onEditInHk(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Edit in hk clicked");
            _main.openHkPage("roomadmin.url", ("" + _SafeStr_3740.flatId));
        }

        private function onSendCaution(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Sending caution...");
            act(true);
        }

        private function onSendMessage(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_14.log("Sending message...");
            act(false);
        }

        private function act(_arg_1:Boolean):void
        {
            if (((_includeInfo) || (_SafeStr_5460.text == "")))
            {
                _main.windowManager.alert("Alert", "You must input a message to the user", 0, onAlertClose);
                return;
            };
            var _local_2:int = determineAction(_arg_1, _SafeStr_5462.isSelected);
            _main.connection.send(new _SafeStr_776(_local_2, _SafeStr_5460.text, ""));
            if ((((_SafeStr_5463.isSelected) || (_SafeStr_5464.isSelected)) || (_SafeStr_5462.isSelected)))
            {
                _main.connection.send(new _SafeStr_855(_SafeStr_3740.flatId, _SafeStr_5463.isSelected, _SafeStr_5464.isSelected, _SafeStr_5462.isSelected));
            };
            this.dispose();
        }

        private function determineAction(_arg_1:Boolean, _arg_2:Boolean):int
        {
            if (_arg_2)
            {
                return ((_arg_1) ? 1 : 4);
            };
            return ((_arg_1) ? 0 : 3);
        }

        private function onInputClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_FOCUSED")
            {
                return;
            };
            if (!_includeInfo)
            {
                return;
            };
            _SafeStr_5460.text = "";
            _includeInfo = false;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function prepareMsgSelect(_arg_1:_SafeStr_3269):void
        {
            _SafeStr_14.log(("MSG TEMPLATES: " + _main.initMsg.roomMessageTemplates.length));
            _arg_1.populate(_main.initMsg.roomMessageTemplates);
        }

        private function onSelectTemplate(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_SELECTED")
            {
                return;
            };
            var _local_3:String = _main.initMsg.roomMessageTemplates[_SafeStr_5461.selection];
            if (_local_3 != null)
            {
                _includeInfo = false;
                _SafeStr_5460.text = _local_3;
            };
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1640 = "_-m18" (String#28924, DoABC#4)
// _SafeStr_1662 = "_-dD" (String#4860, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_5459 = "_-Sk" (String#15318, DoABC#4)
// _SafeStr_5460 = "_-d1E" (String#2603, DoABC#4)
// _SafeStr_5461 = "_-F1" (String#4752, DoABC#4)
// _SafeStr_5462 = "_-1x" (String#8318, DoABC#4)
// _SafeStr_5463 = "_-N1g" (String#10354, DoABC#4)
// _SafeStr_5464 = "_-u1O" (String#10629, DoABC#4)
// _SafeStr_635 = "_-o7" (String#28659, DoABC#4)
// _SafeStr_693 = "_-FO" (String#22438, DoABC#4)
// _SafeStr_776 = "_-h1V" (String#30024, DoABC#4)
// _SafeStr_855 = "_-lx" (String#28762, DoABC#4)


