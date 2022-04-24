// by nota

//com.sulake.habbo.moderation.ChatlogCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.core.utils._SafeStr_24;
    import _-V1k._SafeStr_1616;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.habbo.utils.StringUtil;
    import _-x1P._SafeStr_1647;
    import com.sulake.core.window.components.ITextWindow;
    import _-x1P._SafeStr_1668;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.events.TimerEvent;

    public class ChatlogCtrl implements _SafeStr_13, ITrackedWindow, _SafeStr_3333 
    {

        private static const CHAT_REPORTED_USER_COLOUR:uint = 4293973667;
        private static const CHAT_REPORTEE_COLOUR:uint = 4288921072;

        private static var CHAT_LINE_POOL:Array = [];
        private static var CHAT_LINE_POOL_MAX_SIZE:int = 1000;

        private var _SafeStr_4028:int;
        private var _SafeStr_3820:int;
        private var _msg:IMessageComposer;
        private var _main:ModerationManager;
        private var _frame:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _rooms:Array;
        private var _embedded:Boolean;
        private var _disposed:Boolean;
        private var _SafeStr_5993:_SafeStr_3133;
        private var _SafeStr_5994:_SafeStr_3133;
        private var _hilitedUserIds:Dictionary;
        private var _SafeStr_4078:Timer;
        private var _SafeStr_5995:_SafeStr_24;
        private var _SafeStr_5996:_SafeStr_1616;
        private var _SafeStr_5992:Array = [];
        private var _headers:Array = [];

        public function ChatlogCtrl(_arg_1:IMessageComposer, _arg_2:ModerationManager, _arg_3:int, _arg_4:int, _arg_5:_SafeStr_1616=null, _arg_6:_SafeStr_3133=null, _arg_7:IItemListWindow=null, _arg_8:Boolean=false)
        {
            _main = _arg_2;
            _SafeStr_4028 = _arg_3;
            _SafeStr_3820 = _arg_4;
            _msg = _arg_1;
            _SafeStr_5995 = new _SafeStr_24();
            _SafeStr_5996 = _arg_5;
            _frame = _arg_6;
            _SafeStr_4162 = _arg_7;
            _embedded = _arg_8;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            var _local_2:* = null;
            var _local_1:_SafeStr_3263 = _SafeStr_3263(_main.getXmlWindow("evidence_frame"));
            _local_1.visible = false;
            var _local_3:IItemListWindow = IItemListWindow(_local_1.findChildByName("evidence_list"));
            _SafeStr_5994 = (_local_3.getListItemAt(0) as _SafeStr_3133);
            _SafeStr_5993 = (_local_3.getListItemAt(1) as _SafeStr_3133);
            _local_3.removeListItems();
            _SafeStr_4078 = new Timer(1000, 1);
            _SafeStr_4078.addEventListener("timer", onResizeTimer);
            if (!_embedded)
            {
                _frame = _local_1;
                _frame.procedure = onWindow;
                _frame.visible = true;
                _local_2 = _frame.findChildByTag("close");
                _local_2.procedure = onClose;
                _SafeStr_4162 = _local_3;
            }
            else
            {
                _local_1.dispose();
            };
            _main.connection.send(_msg);
            _main.messageHandler.addChatlogListener(this);
        }

        public function hide():void
        {
            dispose();
        }

        public function onChatlog(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void
        {
            var _local_6:* = null;
            if ((((!(_arg_2 == _SafeStr_4028)) || (!(_arg_3 == _SafeStr_3820))) || (_disposed)))
            {
                return;
            };
            for each (_local_6 in _SafeStr_5992)
            {
                recycleContentLine(_local_6);
            };
            for each (_local_6 in _headers)
            {
                _local_6.dispose();
            };
            _SafeStr_5992 = [];
            _headers = [];
            _main.messageHandler.removeChatlogListener(this);
            _rooms = _arg_4;
            _hilitedUserIds = _arg_5;
            populate();
            onResizeTimer(null);
            if (!_embedded)
            {
                _frame.caption = _arg_1;
                _frame.visible = true;
            };
        }

        public function getType():int
        {
            return (_SafeStr_4028);
        }

        public function getId():String
        {
            return ("" + _SafeStr_3820);
        }

        public function setId(_arg_1:int):void
        {
            _SafeStr_3820 = _arg_1;
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame as _SafeStr_3263);
        }

        private function populate():void
        {
            var _local_1:* = null;
            _SafeStr_4162.autoArrangeItems = false;
            _SafeStr_4162.removeListItems();
            for each (_local_1 in _rooms)
            {
                populateEvidence(_local_1);
            };
            _SafeStr_4162.autoArrangeItems = true;
        }

        private function populateEvidence(_arg_1:_SafeStr_1647):void
        {
            var _local_10:* = null;
            var _local_7:int;
            var _local_8:* = null;
            var _local_6:_SafeStr_3133 = createHeaderLine();
            var _local_9:_SafeStr_3109 = _local_6.findChildByName("text");
            var _local_2:_SafeStr_3122 = _SafeStr_3122(_local_6.findChildByName("btnHeaderAction"));
            var _local_3:_SafeStr_3122 = _SafeStr_3122(_local_6.findChildByName("btnHeaderAction2"));
            if (_local_3)
            {
                _local_3.visible = false;
            };
            switch (_arg_1.recordType)
            {
                case 1:
                    if (_arg_1.roomId > 0)
                    {
                        _local_2.caption = "Room tool";
                        if (_arg_1.roomName == null)
                        {
                            _local_9.caption = ("Room #" + _arg_1.roomId);
                        }
                        else
                        {
                            _local_9.caption = ("Room: " + _arg_1.roomName);
                        };
                        _local_3.visible = true;
                        _local_3.caption = "View room";
                        new OpenRoomInSpectatorMode(_main, _local_3, _arg_1.roomId);
                        if (_embedded)
                        {
                            new OpenRoomTool(null, _main, _local_2, _arg_1.roomId);
                        }
                        else
                        {
                            new OpenRoomTool((_frame as _SafeStr_3263), _main, _local_2, _arg_1.roomId);
                        };
                    };
                    break;
                case 2:
                    _local_9.caption = "IM session";
                    break;
                case 3:
                    _local_9.caption = "Forum thread";
                    _local_3.visible = true;
                    _local_3.caption = "Open thread";
                    new OpenDiscussionThread(_main, _local_3, _arg_1.groupId, _arg_1.threadId);
                    _local_2.caption = "Delete";
                    new HideDiscussionThread(_main, this, _local_2, _arg_1.groupId, _arg_1.threadId);
                    break;
                case 4:
                    _local_9.caption = "Forum message";
                    _local_3.visible = true;
                    _local_3.caption = "Open Message";
                    new OpenDiscussionMessage(_main, _local_3, _arg_1.groupId, _arg_1.threadId, _arg_1.context.messageIndex);
                    _local_2.caption = "Delete";
                    new HideDiscussionMessage(_main, this, _local_2, _arg_1.groupId, _arg_1.threadId, _arg_1.messageId);
                    break;
                case 5:
                    _local_9.caption = "Selfie report";
                    _local_3.visible = true;
                    _local_3.caption = "View selfie";
                    new OpenExternalLink(_main, _local_3, _arg_1.context.url);
                    _local_2.visible = true;
                    _local_2.caption = "Room tool";
                    if (_embedded)
                    {
                        new OpenRoomTool(null, _main, _local_2, _arg_1.roomId);
                    }
                    else
                    {
                        new OpenRoomTool((_frame as _SafeStr_3263), _main, _local_2, _arg_1.roomId);
                    };
                    break;
                case 6:
                    _local_9.caption = "Photo report";
                    _local_3.visible = true;
                    _local_3.caption = "Moderate photo";
                    _local_10 = _main.getProperty("stories.admin.tool.base.url");
                    if (StringUtil.isEmpty(_local_10))
                    {
                        _local_10 = "https://theallseeingeye.sulake.com/habbo-stories-admin/#/photos/";
                    };
                    _local_10 = (_local_10 + _arg_1.context.extraDataId);
                    new OpenExternalLink(_main, _local_3, _local_10);
                    _local_2.visible = true;
                    _local_2.caption = "Room tool";
                    if (_embedded)
                    {
                        new OpenRoomTool(null, _main, _local_2, _arg_1.roomId);
                    }
                    else
                    {
                        new OpenRoomTool((_frame as _SafeStr_3263), _main, _local_2, _arg_1.roomId);
                    };
                default:
            };
            addHeaderLineToList(_local_6);
            var _local_4:Boolean = true;
            var _local_5:int = -1;
            _local_7 = 0;
            while (_local_7 < _arg_1.chatlog.length)
            {
                _local_8 = _arg_1.chatlog[_local_7];
                populateContentLine(_local_8, _local_4);
                _local_4 = (!(_local_4));
                if (((_local_8.hasHighlighting) && (_local_5 == -1)))
                {
                    _local_5 = _local_7;
                };
                _local_7++;
            };
            if (_local_5 > -1)
            {
                _SafeStr_4162.autoArrangeItems = true;
                if (_SafeStr_4162.maxScrollV > 0)
                {
                    _SafeStr_4162.scrollV = (_SafeStr_4162.getListItemAt(_local_5).y / _SafeStr_4162.maxScrollV);
                };
            };
        }

        private function addContentLineToList(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_4162.addListItem(_arg_1);
            _SafeStr_5992.push(_arg_1);
        }

        private function addHeaderLineToList(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_4162.addListItem(_arg_1);
            _headers.push(_arg_1);
        }

        private function createContentLine():_SafeStr_3133
        {
            if (CHAT_LINE_POOL.length > 0)
            {
                return (CHAT_LINE_POOL.pop() as _SafeStr_3133);
            };
            return (_SafeStr_3133(_SafeStr_5993.clone()));
        }

        private function recycleContentLine(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            if (CHAT_LINE_POOL.length < CHAT_LINE_POOL_MAX_SIZE)
            {
                _local_2 = ITextWindow(_arg_1.findChildByName("chatter_txt"));
                _local_2.removeEventListener("WME_CLICK", onUserClick);
                _arg_1.width = _SafeStr_5993.width;
                _arg_1.height = (_SafeStr_5993.height - 10);
                CHAT_LINE_POOL.push(_arg_1);
            }
            else
            {
                _arg_1.dispose();
            };
        }

        private function createHeaderLine():_SafeStr_3133
        {
            return (_SafeStr_5994.clone() as _SafeStr_3133);
        }

        private function populateContentLine(_arg_1:_SafeStr_1668, _arg_2:Boolean):void
        {
            var _local_5:* = null;
            var _local_7:_SafeStr_3133 = createContentLine();
            var _local_8:_SafeStr_3109 = _local_7.findChildByName("time_txt");
            var _local_4:ITextWindow = ITextWindow(_local_7.findChildByName("chatter_txt"));
            var _local_6:ITextWindow = (_local_7.findChildByName("msg_txt") as ITextWindow);
            _local_8.caption = _arg_1.timeStamp;
            var _local_9:* = _hilitedUserIds[_arg_1.chatterId];
            if (_local_9 != null)
            {
                _local_7.color = (((_local_9 as int) == 0) ? 4293973667 : 4288921072);
            }
            else
            {
                _local_7.color = ((_arg_2) ? 4291030266 : 0xFFFFFFFF);
            };
            if (_arg_1.hasHighlighting)
            {
                _local_5 = _local_6.getTextFormat();
                _local_5.bold = true;
                _local_6.setTextFormat(_local_5);
                _local_6.bold = true;
            };
            if (_arg_1.chatterId > 0)
            {
                _local_4.text = _arg_1.chatterName;
                _local_4.underline = true;
                _local_4.addEventListener("WME_CLICK", onUserClick);
                if (!_SafeStr_5995.getValue(_arg_1.chatterName))
                {
                    _SafeStr_5995.add(_arg_1.chatterName, _arg_1.chatterId);
                };
            }
            else
            {
                if (_arg_1.chatterId == 0)
                {
                    _local_4.text = "Bot / pet";
                    _local_4.underline = false;
                }
                else
                {
                    _local_4.text = "-";
                    _local_4.underline = false;
                };
            };
            _local_4.color = _local_7.color;
            _local_8.color = _local_7.color;
            _local_6.color = _local_7.color;
            _local_6.text = _arg_1.msg;
            var _local_3:int = Math.max(_local_8.height, (_local_6.textHeight + 5));
            _local_6.height = _local_3;
            if (_local_6.getTextFormat())
            {
                _local_6.getTextFormat().align = "left";
                _local_6.getTextFormat().rightMargin = (_local_6.getTextFormat().rightMargin + 10);
            };
            _local_4.height = _local_3;
            _local_8.height = _local_3;
            _local_7.height = _local_3;
            addContentLineToList(_local_7);
        }

        private function onUserClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:String = _arg_1.target.caption;
            var _local_3:int = _SafeStr_5995.getValue(_local_2);
            _main.windowTracker.show(new UserInfoFrameCtrl(_main, _local_3, _SafeStr_5996), (_frame as _SafeStr_3263), false, false, true);
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            dispose();
        }

        private function onWindow(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WE_RESIZED")) || (!(_arg_2 == _frame))))
            {
                return;
            };
            _SafeStr_4078.reset();
            _SafeStr_4078.start();
        }

        private function onResizeTimer(_arg_1:TimerEvent):void
        {
            refreshListDims();
            var _local_2:Boolean = refreshScrollBarVisibility();
        }

        private function refreshListDims():void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:int;
            _SafeStr_4162.autoArrangeItems = false;
            var _local_1:int = _SafeStr_4162.numListItems;
            _local_3 = 0;
            while (_local_3 < _local_1)
            {
                _local_4 = _SafeStr_3133(_SafeStr_4162.getListItemAt(_local_3));
                if (_local_4.name == "chatline")
                {
                    _local_2 = ITextWindow(_local_4.findChildByName("msg_txt"));
                    _local_2.width = (_local_4.width - _local_2.x);
                    _local_2.height = (_local_2.textHeight + 5);
                    _local_4.height = _local_2.height;
                };
                _local_3++;
            };
            _SafeStr_4162.autoArrangeItems = true;
        }

        private function refreshScrollBarVisibility():Boolean
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.parent);
            var _local_4:_SafeStr_3109 = (_local_2.getChildByName("scroller") as _SafeStr_3109);
            var _local_3:* = (_SafeStr_4162.scrollableRegion.height > _SafeStr_4162.height);
            var _local_1:int = 22;
            if (_local_4.visible)
            {
                if (_local_3)
                {
                    return (false);
                };
                _local_4.visible = false;
                _SafeStr_4162.width = (_SafeStr_4162.width + _local_1);
                return (true);
            };
            if (_local_3)
            {
                _local_4.visible = true;
                _SafeStr_4162.width = (_SafeStr_4162.width - _local_1);
                return (true);
            };
            return (false);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _main = null;
            _msg = null;
            _SafeStr_5996 = null;
            if (_SafeStr_4162 != null)
            {
                _SafeStr_4162.removeListItems();
                _SafeStr_4162.dispose();
                _SafeStr_4162 = null;
            };
            if (_frame != null)
            {
                _frame.destroy();
                _frame = null;
            };
            _rooms = null;
            _hilitedUserIds = null;
            if (_SafeStr_4078 != null)
            {
                _SafeStr_4078.stop();
                _SafeStr_4078.removeEventListener("timer", onResizeTimer);
                _SafeStr_4078 = null;
            };
            if (!_embedded)
            {
                for each (_local_1 in _SafeStr_5992)
                {
                    recycleContentLine(_local_1);
                };
                for each (_local_1 in _headers)
                {
                    _local_1.dispose();
                };
            };
            _SafeStr_5992 = [];
            _headers = [];
            if (_SafeStr_5993 != null)
            {
                _SafeStr_5993.dispose();
                _SafeStr_5993 = null;
            };
            if (_SafeStr_5994 != null)
            {
                _SafeStr_5994.dispose();
                _SafeStr_5994 = null;
            };
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_1647 = "_-WG" (String#29112, DoABC#4)
// _SafeStr_1668 = "_-kX" (String#30865, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3333 = "_-Vk" (String#10240, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4078 = "_-N1D" (String#1602, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_5992 = "_-Hz" (String#7295, DoABC#4)
// _SafeStr_5993 = "_-h1q" (String#7619, DoABC#4)
// _SafeStr_5994 = "_-Mq" (String#9116, DoABC#4)
// _SafeStr_5995 = "_-02Z" (String#11999, DoABC#4)
// _SafeStr_5996 = "_-Kr" (String#2988, DoABC#4)


