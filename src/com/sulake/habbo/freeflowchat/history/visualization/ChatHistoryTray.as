// by nota

//com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray

package com.sulake.habbo.freeflowchat.history.visualization
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class ChatHistoryTray implements _SafeStr_13, _SafeStr_41 
    {

        private var _rootDisplayObject:DisplayObjectContainer;
        private var _SafeStr_4888:Stage;
        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_4887:ChatHistoryScrollView;
        private var _tab:Sprite;
        private var _SafeStr_4885:Bitmap;
        private var _SafeStr_4886:Bitmap;
        private var _bg:Bitmap;
        private var _openedWidth:int;
        private var _flagUpdateDisableRoomMouseEvents:Boolean = false;

        public function ChatHistoryTray(_arg_1:HabboFreeFlowChat, _arg_2:ChatHistoryScrollView)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_4887 = _arg_2;
            _rootDisplayObject = new Sprite();
            _SafeStr_4885 = new Bitmap();
            _SafeStr_4885.bitmapData = BitmapData(_SafeStr_4147.assets.getAssetByName("tray_bar").content);
            _SafeStr_4885.width = _SafeStr_4885.bitmapData.width;
            _SafeStr_4885.height = 0;
            _SafeStr_4885.scaleX = 1;
            _SafeStr_4885.x = -(_SafeStr_4885.bitmapData.width);
            _SafeStr_4886 = new Bitmap();
            _SafeStr_4886.bitmapData = BitmapData(_SafeStr_4147.assets.getAssetByName("tray_handle_open").content);
            _SafeStr_4886.scaleX = 1;
            _SafeStr_4886.scaleY = 1;
            _SafeStr_4886.x = -(0);
            _SafeStr_4886.y = 350;
            _SafeStr_4886.visible = false;
            _tab = new Sprite();
            _tab.scaleX = 1;
            _tab.scaleY = 1;
            _tab.visible = true;
            _tab.addChild(_SafeStr_4885);
            _tab.addChild(_SafeStr_4886);
            _rootDisplayObject.addChild(_tab);
            _bg = new Bitmap();
            _bg.bitmapData = new BitmapData(1, 1, true, 2720277278);
            _bg.width = 0;
            _bg.height = 0;
            _rootDisplayObject.addChild(_bg);
            _rootDisplayObject.addEventListener("addedToStage", onAddedToStage);
            _openedWidth = ((350 + 62) + 1);
        }

        public function dispose():void
        {
            _SafeStr_4147.disableRoomMouseEventsLeftOfX(0);
            if (_rootDisplayObject)
            {
                _SafeStr_4887.deactivateScrolling();
                if (_SafeStr_4888)
                {
                    _SafeStr_4888.removeEventListener("mouseDown", stageMouseClickedEventHandler);
                };
            };
            _rootDisplayObject = null;
        }

        public function get disposed():Boolean
        {
            return (_rootDisplayObject == null);
        }

        public function get rootDisplayObject():DisplayObjectContainer
        {
            return (_rootDisplayObject);
        }

        public function resize(_arg_1:int, _arg_2:int):void
        {
            _tab.height = (_arg_2 - 50);
            _SafeStr_4885.height = (_arg_2 - 50);
            _bg.height = (_arg_2 - 50);
            _tab.scaleY = 1;
            _SafeStr_4886.scaleY = 1;
            _SafeStr_4886.y = (_arg_2 - 215);
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            resize(_rootDisplayObject.stage.stageWidth, _rootDisplayObject.stage.stageHeight);
            _rootDisplayObject.stage.addEventListener("click", stageMouseClickedEventHandler);
            _SafeStr_4888 = _rootDisplayObject.stage;
        }

        public function toggleHistoryVisibility():void
        {
            if (_SafeStr_4887.isActive)
            {
                _SafeStr_4887.deactivateScrolling();
                _rootDisplayObject.removeChild(_SafeStr_4887.rootDisplayObject);
                _SafeStr_4887.deactivateView();
                _bg.width = 0;
                _SafeStr_4885.x = -(_SafeStr_4885.bitmapData.width);
                _SafeStr_4886.x = -(0);
                _SafeStr_4886.visible = false;
                _SafeStr_4887.viewWidth = 0;
                _SafeStr_4886.bitmapData = BitmapData(_SafeStr_4147.assets.getAssetByName("tray_handle_open").content);
            }
            else
            {
                _rootDisplayObject.addChild(_SafeStr_4887.rootDisplayObject);
                _SafeStr_4887.scrollToBottom();
                _SafeStr_4887.activateScrolling();
                _SafeStr_4887.activateView();
                _bg.width = _openedWidth;
                _SafeStr_4885.x = _openedWidth;
                _SafeStr_4886.visible = true;
                _SafeStr_4886.x = ((_openedWidth - 0) + _SafeStr_4885.bitmapData.width);
                _SafeStr_4887.viewWidth = _openedWidth;
                _SafeStr_4886.bitmapData = BitmapData(_SafeStr_4147.assets.getAssetByName("tray_handle_close").content);
            };
            _flagUpdateDisableRoomMouseEvents = true;
        }

        private function stageMouseClickedEventHandler(_arg_1:Event):void
        {
            if (((!(_rootDisplayObject)) || (!(_rootDisplayObject.stage))))
            {
                return;
            };
            var _local_2:MouseEvent = MouseEvent(_arg_1);
            if ((((((_SafeStr_4887.isActive) && (_SafeStr_4886.x <= _local_2.stageX)) && (_local_2.stageX <= (_SafeStr_4886.x + _SafeStr_4886.width))) && (_SafeStr_4886.y <= _local_2.stageY)) && (_local_2.stageY <= (_SafeStr_4886.y + _SafeStr_4886.height))))
            {
                toggleHistoryVisibility();
            };
        }

        public function update(_arg_1:uint):void
        {
            if (((_flagUpdateDisableRoomMouseEvents) && (_arg_1 > 20)))
            {
                _SafeStr_4147.disableRoomMouseEventsLeftOfX(((_SafeStr_4887.isActive) ? (_openedWidth + _SafeStr_4885.bitmapData.width) : 0));
                _flagUpdateDisableRoomMouseEvents = false;
            };
        }


    }
}//package com.sulake.habbo.freeflowchat.history.visualization

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4885 = "_-l1E" (String#4385, DoABC#4)
// _SafeStr_4886 = "_-PZ" (String#3358, DoABC#4)
// _SafeStr_4887 = "_-R1A" (String#3100, DoABC#4)
// _SafeStr_4888 = "_-b1R" (String#2081, DoABC#4)


