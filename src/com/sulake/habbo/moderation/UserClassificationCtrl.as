// by nota

//com.sulake.habbo.moderation.UserClassificationCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.util.VisitUserUtil;
    import com.sulake.habbo.userclassification.UserClassificationData;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.events.TimerEvent;

    public class UserClassificationCtrl implements _SafeStr_13, ITrackedWindow 
    {

        private static var CLASSIFICATION_ROW_POOL:Array = [];
        private static var CLASSIFICATION_ROW_POOL_MAX_SIZE:int = 200;

        private var _main:ModerationManager;
        private var _frame:_SafeStr_3263;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_5500:int;
        private var _SafeStr_5501:Array;
        private var _disposed:Boolean;
        private var _SafeStr_5503:_SafeStr_3133;
        private var _SafeStr_4078:Timer;
        private var _SafeStr_5502:Array = [];

        public function UserClassificationCtrl(_arg_1:ModerationManager, _arg_2:int)
        {
            _main = _arg_1;
            _SafeStr_5500 = _arg_2;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            _SafeStr_4078 = new Timer(300, 1);
            _SafeStr_4078.addEventListener("timer", onResizeTimer);
            _main.messageHandler.addUserClassificationListener(this);
            _frame = _SafeStr_3263(_main.getXmlWindow("userclassification_frame"));
            _SafeStr_4162 = IItemListWindow(_frame.findChildByName("userclassification_list"));
            _SafeStr_5503 = (_SafeStr_4162.getListItemAt(0) as _SafeStr_3133);
            _SafeStr_4162.removeListItems();
            _frame.procedure = onWindow;
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            _local_1.procedure = onClose;
        }

        public function onUserClassification(_arg_1:int, _arg_2:Array):void
        {
            if (_arg_1 != _SafeStr_5500)
            {
                return;
            };
            if (_disposed)
            {
                return;
            };
            this._SafeStr_5501 = _arg_2;
            _frame.caption = "";
            populate();
            onResizeTimer(null);
            _frame.visible = true;
            _main.messageHandler.removeUserClassificationListener(this);
        }

        private function populate():void
        {
            var _local_2:* = null;
            var _local_1:Boolean = true;
            for each (_local_2 in _SafeStr_5501)
            {
                populateRoomRow(_local_2, _local_1);
                _local_1 = (!(_local_1));
            };
        }

        private function populateRoomRow(_arg_1:UserClassificationData, _arg_2:Boolean):void
        {
            var _local_5:_SafeStr_3133 = getRoomRowWindow();
            var _local_3:uint = ((_arg_2) ? 4288861930 : 0xFFFFFFFF);
            _local_5.color = _local_3;
            var _local_6:_SafeStr_3109 = _local_5.findChildByName("user_name_txt");
            _local_6.caption = _arg_1.username;
            _local_6.color = _local_3;
            var _local_4:ITextWindow = ITextWindow(_local_5.findChildByName("visit_room_txt"));
            _local_4.color = _local_3;
            var _local_7:ITextWindow = ITextWindow(_local_5.findChildByName("user_classification_txt"));
            _local_7.text = _arg_1.classType;
            if (((!(_main)) || (!(_main.isModerator))))
            {
                _local_7.visible = false;
                _local_4.visible = false;
            };
            addClassificationRowToList(_local_5, _SafeStr_4162);
            if (((_main) && (_main.isModerator)))
            {
                new OpenUserInfo(_frame, _main, _local_6, _arg_1.userId);
                new VisitUserUtil(_main, _local_4, _arg_1.userId);
            };
        }

        private function addClassificationRowToList(_arg_1:_SafeStr_3133, _arg_2:IItemListWindow):void
        {
            _arg_2.addListItem(_arg_1);
            _SafeStr_5502.push(_arg_1);
        }

        private function getRoomRowWindow():_SafeStr_3133
        {
            if (CLASSIFICATION_ROW_POOL.length > 0)
            {
                return (CLASSIFICATION_ROW_POOL.pop() as _SafeStr_3133);
            };
            return (_SafeStr_3133(_SafeStr_5503.clone()));
        }

        private function storeClassificationRowWindow(_arg_1:_SafeStr_3133):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (CLASSIFICATION_ROW_POOL.length < CLASSIFICATION_ROW_POOL_MAX_SIZE)
            {
                _local_3 = _arg_1.findChildByName("user_name_txt");
                _local_3.procedure = null;
                _local_2 = _arg_1.findChildByName("visit_room_txt");
                _local_2.procedure = null;
                _arg_1.width = _SafeStr_5503.width;
                _arg_1.height = _SafeStr_5503.height;
                CLASSIFICATION_ROW_POOL.push(_arg_1);
            }
            else
            {
                _arg_1.dispose();
            };
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
            if (!this._SafeStr_4078.running)
            {
                this._SafeStr_4078.reset();
                this._SafeStr_4078.start();
            };
        }

        private function onResizeTimer(_arg_1:TimerEvent):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.parent);
            var _local_5:_SafeStr_3109 = (_local_3.getChildByName("scroller") as _SafeStr_3109);
            var _local_4:* = (_SafeStr_4162.scrollableRegion.height > _SafeStr_4162.height);
            var _local_2:int = 17;
            if (_local_5.visible)
            {
                if (!_local_4)
                {
                    _local_5.visible = false;
                    _SafeStr_4162.width = (_SafeStr_4162.width + _local_2);
                };
            }
            else
            {
                if (_local_4)
                {
                    _local_5.visible = true;
                    _SafeStr_4162.width = (_SafeStr_4162.width - _local_2);
                };
            };
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_disposed)
            {
                return;
            };
            _disposed = true;
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
            _main = null;
            if (_SafeStr_4078 != null)
            {
                _SafeStr_4078.stop();
                _SafeStr_4078.removeEventListener("timer", onResizeTimer);
                _SafeStr_4078 = null;
            };
            for each (_local_1 in _SafeStr_5502)
            {
                storeClassificationRowWindow(_local_1);
            };
            if (_SafeStr_5503 != null)
            {
                _SafeStr_5503.dispose();
                _SafeStr_5503 = null;
            };
            _SafeStr_5502 = [];
        }

        public function getType():int
        {
            return (6);
        }

        public function getId():String
        {
            return ("" + _SafeStr_5500);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4078 = "_-N1D" (String#1602, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_5500 = "_-x" (String#14125, DoABC#4)
// _SafeStr_5501 = "_-lY" (String#24501, DoABC#4)
// _SafeStr_5502 = "_-x1Q" (String#10833, DoABC#4)
// _SafeStr_5503 = "_-np" (String#3902, DoABC#4)


