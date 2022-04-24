// by nota

//com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollBar

package com.sulake.habbo.freeflowchat.history.visualization
{
    import flash.display.Sprite;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class ChatHistoryScrollBar 
    {

        public static const RIGHT_MARGIN:int = 0;

        private var _SafeStr_4887:ChatHistoryScrollView;
        private var _displayObject:Sprite;
        private var _background:Sprite;
        private var _SafeStr_5450:Sprite;
        private var _SafeStr_5266:int;
        private var _SafeStr_5451:int;
        private var _SafeStr_4888:Stage;

        public function ChatHistoryScrollBar(_arg_1:ChatHistoryScrollView, _arg_2:HabboFreeFlowChat)
        {
            _SafeStr_4887 = _arg_1;
            _SafeStr_5450 = HabboFreeFlowChat.create9SliceSprite(new Rectangle(2, 2, 1, 1), (_arg_2.assets.getAssetByName("scrollbar_thumb").content as BitmapData));
            _SafeStr_5450.x = 2;
            _SafeStr_5450.y = 2;
            _background = HabboFreeFlowChat.create9SliceSprite(new Rectangle(2, 2, 5, 5), (_arg_2.assets.getAssetByName("scrollbar_back").content as BitmapData));
            _displayObject = new Sprite();
            _displayObject.addChild(_background);
            _displayObject.addChild(_SafeStr_5450);
            _SafeStr_5450.addEventListener("addedToStage", onAddedToStage);
            _SafeStr_5450.addEventListener("removedFromStage", onRemovedFromStage);
            _SafeStr_5450.addEventListener("mouseDown", mouseDownEventHandler);
        }

        public function set height(_arg_1:int):void
        {
            _background.height = _arg_1;
            updateThumbTrack();
        }

        public function get displayObject():Sprite
        {
            return (_displayObject);
        }

        public function updateThumbTrack():void
        {
            var _local_1:int = (_SafeStr_4887.topY + (_SafeStr_4887.viewPort.height - _background.height));
            _SafeStr_5450.height = Math.min((_background.height - 4), Math.max(5, int(((_background.height - 4) * (_background.height / _SafeStr_4887.bufferHeight)))));
            _SafeStr_5450.y = Math.min(((_background.height - 2) - _SafeStr_5450.height), Math.max(2, int((((_background.height - 4) * (Math.max(1, _local_1) / _SafeStr_4887.bufferHeight)) - (_SafeStr_5450.height / 2)))));
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            _SafeStr_4888 = _SafeStr_5450.stage;
        }

        private function onRemovedFromStage(_arg_1:Event):void
        {
            _SafeStr_4888 = null;
        }

        private function mouseDownEventHandler(_arg_1:Event):void
        {
            _SafeStr_5266 = MouseEvent(_arg_1).stageY;
            _SafeStr_5451 = _SafeStr_4887.topY;
            _SafeStr_4888.addEventListener("mouseUp", mouseDragEventHandler);
            _SafeStr_4888.addEventListener("mouseMove", mouseDragEventHandler);
            _arg_1.stopImmediatePropagation();
        }

        private function mouseDragEventHandler(_arg_1:Event):void
        {
            var _local_4:Number;
            var _local_2:int;
            var _local_3:MouseEvent = MouseEvent(_arg_1);
            switch (_local_3.type)
            {
                case "mouseMove":
                    _local_4 = (_SafeStr_4887.bufferHeight / _background.height);
                    _local_2 = ((_local_3.stageY - _SafeStr_5266) * _local_4);
                    _SafeStr_4887.topY = (_SafeStr_5451 + _local_2);
                    break;
                case "mouseUp":
                    endScroll();
            };
            _arg_1.stopImmediatePropagation();
        }

        public function endScroll():void
        {
            if (_SafeStr_4888)
            {
                _SafeStr_4888.removeEventListener("mouseUp", mouseDragEventHandler);
                _SafeStr_4888.removeEventListener("mouseMove", mouseDragEventHandler);
            };
        }


    }
}//package com.sulake.habbo.freeflowchat.history.visualization

// _SafeStr_4887 = "_-R1A" (String#3100, DoABC#4)
// _SafeStr_4888 = "_-b1R" (String#2081, DoABC#4)
// _SafeStr_5266 = "_-d1b" (String#5796, DoABC#4)
// _SafeStr_5450 = "_-K1U" (String#5416, DoABC#4)
// _SafeStr_5451 = "_-c1G" (String#17830, DoABC#4)


