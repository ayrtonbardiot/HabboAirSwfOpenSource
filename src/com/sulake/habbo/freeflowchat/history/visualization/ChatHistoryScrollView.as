// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView

package com.sulake.habbo.freeflowchat.history.visualization
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.history.visualization.entry._SafeStr_3281;
    import flash.geom.Rectangle;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.history.visualization.entry._SafeStr_3280;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.freeflowchat.history.*;

    public class ChatHistoryScrollView implements _SafeStr_13 
    {

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _historyBuffer:ChatHistoryBuffer;
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _SafeStr_4888:Stage;
        private var _SafeStr_5263:Vector.<_SafeStr_3281>;
        private var _SafeStr_5262:int = 0;
        private var _SafeStr_5265:Rectangle;
        private var _visibleWidth:int = 0;
        private var _SafeStr_5266:int;
        private var _SafeStr_5267:int;
        private var _SafeStr_4537:Sprite;
        private var _SafeStr_4495:Boolean = false;
        private var _scrollBar:ChatHistoryScrollBar;
        private var _ignore:Bitmap;
        private var _SafeStr_5264:_SafeStr_3281;

        public function ChatHistoryScrollView(_arg_1:HabboFreeFlowChat, _arg_2:ChatHistoryBuffer)
        {
            _SafeStr_4147 = _arg_1;
            _historyBuffer = _arg_2;
            _rootDisplayObject = new Sprite();
            _rootDisplayObject.x = 0;
            _rootDisplayObject.y = 0;
            _rootDisplayObject.addEventListener("addedToStage", onAddedToStage);
            _scrollBar = new ChatHistoryScrollBar(this, _arg_1);
            _ignore = new Bitmap();
            _ignore.bitmapData = BitmapData(_SafeStr_4147.assets.getAssetByName("close_x").content);
            _SafeStr_5264 = null;
        }

        public function dispose():void
        {
            deactivateScrolling();
            deactivateView();
            _SafeStr_4537 = null;
            _ignore = null;
            _SafeStr_5264 = null;
            if (_rootDisplayObject)
            {
                _rootDisplayObject.removeEventListener("addedToStage", onAddedToStage);
                _rootDisplayObject = null;
            };
        }

        public function get disposed():Boolean
        {
            return ((_SafeStr_4537 == null) && (_rootDisplayObject == null));
        }

        public function get rootDisplayObject():DisplayObjectContainer
        {
            return (_rootDisplayObject);
        }

        public function activateView():void
        {
            var _local_4:int;
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:* = null;
            if (!_historyBuffer)
            {
                return;
            };
            deactivateView();
            _SafeStr_5263 = new Vector.<_SafeStr_3281>(_historyBuffer.entries.length);
            _local_4 = 0;
            _local_3 = -(_SafeStr_5262);
            while (_local_4 < _historyBuffer.entries.length)
            {
                _local_2 = new _SafeStr_3281();
                _local_1 = _historyBuffer.entries[_local_4];
                _local_2.roomId = _local_1.roomId;
                _local_2.userId = _local_1.userId;
                _local_2.bitmapData = _local_1.bitmap;
                _local_2.canIgnore = _local_1.canIgnore;
                _local_2.userName = _local_1.userName;
                _local_3 = (_local_3 - _local_1.overlap.y);
                _local_2.y = _local_3;
                _local_2.x = 3;
                _local_3 = (_local_3 + _local_2.bitmapData.height);
                _local_3 = (_local_3 - 8);
                _SafeStr_5263[_local_4] = _local_2;
                _rootDisplayObject.addChild(_SafeStr_5263[_local_4]);
                _local_4++;
            };
            _rootDisplayObject.addChild(_scrollBar.displayObject);
            _SafeStr_4495 = true;
        }

        public function deactivateView():void
        {
            if (disposed)
            {
                return;
            };
            for each (var _local_1:Bitmap in _SafeStr_5263)
            {
                _rootDisplayObject.removeChild(_local_1);
                _local_1.bitmapData = null;
            };
            if (_SafeStr_5264 != null)
            {
                _rootDisplayObject.removeChild(_ignore);
                _SafeStr_5264 = null;
            };
            _SafeStr_5263 = new Vector.<_SafeStr_3281>(0);
            if (((!(_scrollBar.displayObject == null)) && (_scrollBar.displayObject.parent == _rootDisplayObject)))
            {
                _rootDisplayObject.removeChild(_scrollBar.displayObject);
            };
            _SafeStr_4495 = false;
        }

        public function activateScrolling():void
        {
            deactivateScrolling();
            _rootDisplayObject.stage.addEventListener("mouseDown", mouseDragEventHandler);
            _SafeStr_4888 = _rootDisplayObject.stage;
            _SafeStr_4888.addEventListener("resize", onStageResized);
        }

        public function deactivateScrolling():void
        {
            if (_SafeStr_4888)
            {
                _SafeStr_4888.removeEventListener("mouseDown", mouseDragEventHandler);
                _SafeStr_4888.removeEventListener("mouseMove", mouseDragEventHandler, true);
                _SafeStr_4888.removeEventListener("mouseUp", mouseDragEventHandler);
                _SafeStr_4888.removeEventListener("resize", onStageResized);
            };
        }

        public function get topY():int
        {
            return (_SafeStr_5262);
        }

        public function get bufferHeight():int
        {
            return (_historyBuffer.totalHeight);
        }

        public function set topY(_arg_1:int):void
        {
            var _local_4:int;
            var _local_3:int;
            var _local_2:* = null;
            _SafeStr_5262 = _arg_1;
            if (_SafeStr_5263)
            {
                _local_4 = 0;
                _local_3 = -(_SafeStr_5262);
                while (_local_4 < _historyBuffer.entries.length)
                {
                    if (_SafeStr_5263.length <= _local_4) break;
                    _local_2 = _historyBuffer.entries[_local_4];
                    _local_3 = (_local_3 - _local_2.overlap.y);
                    _SafeStr_5263[_local_4].y = _local_3;
                    _local_3 = (_local_3 + (_local_2.bitmap.height - 8));
                    _local_4++;
                };
            };
            if (_SafeStr_5264 != null)
            {
                _ignore.y = (_SafeStr_5264.y + ((_SafeStr_5264.height - _ignore.height) / 2));
            };
            _scrollBar.updateThumbTrack();
        }

        public function addHistoryEntry(_arg_1:_SafeStr_3280):void
        {
            var _local_2:_SafeStr_3281 = new _SafeStr_3281();
            _local_2.bitmapData = _arg_1.bitmap;
            _local_2.y = (((-(_SafeStr_5262) + _historyBuffer.totalHeight) - _arg_1.bitmap.height) + 8);
            _local_2.x = 3;
            _local_2.userId = _arg_1.userId;
            _local_2.roomId = _arg_1.roomId;
            _local_2.canIgnore = _arg_1.canIgnore;
            _local_2.userName = _arg_1.userName;
            _SafeStr_5263.push(_local_2);
            _rootDisplayObject.addChild(_SafeStr_5263[(_SafeStr_5263.length - 1)]);
        }

        public function scrollUpAndSpliceTopItem(_arg_1:int):void
        {
            if (((_SafeStr_5263) && (_SafeStr_5263.length > 0)))
            {
                _rootDisplayObject.removeChild(_SafeStr_5263[0]);
                _SafeStr_5263.splice(0, 1);
                for each (var _local_2:Bitmap in _SafeStr_5263)
                {
                    _local_2.y = (_local_2.y - _arg_1);
                };
            };
        }

        public function get viewPort():Rectangle
        {
            return (_SafeStr_5265);
        }

        public function set viewPort(_arg_1:Rectangle):void
        {
            _SafeStr_5265 = _arg_1;
            _rootDisplayObject.width = _arg_1.width;
            _rootDisplayObject.height = _arg_1.height;
            _rootDisplayObject.scaleX = 1;
            _rootDisplayObject.scaleY = 1;
            if (!_SafeStr_4537)
            {
                _SafeStr_4537 = new Sprite();
                _rootDisplayObject.addChild(_SafeStr_4537);
            };
            _SafeStr_4537.graphics.clear();
            _SafeStr_4537.graphics.beginFill(0xFFFFFF);
            _SafeStr_4537.graphics.drawRect(0, 0, viewPort.width, viewPort.height);
            _rootDisplayObject.mask = _SafeStr_4537;
            _scrollBar.displayObject.x = (_SafeStr_5265.width - 0);
            viewBottom = _arg_1.height;
        }

        public function set viewBottom(_arg_1:int):void
        {
            _rootDisplayObject.y = (_arg_1 - _SafeStr_5265.height);
            _scrollBar.height = _arg_1;
            _scrollBar.displayObject.y = (_SafeStr_5265.height - _arg_1);
        }

        public function set viewWidth(_arg_1:int):void
        {
            _visibleWidth = _arg_1;
            _scrollBar.displayObject.x = (_visibleWidth - 0);
        }

        public function scrollToBottom():void
        {
            topY = ((_historyBuffer.totalHeight - viewPort.height) + 100);
        }

        public function get isActive():Boolean
        {
            return (_SafeStr_4495);
        }

        private function findSpriteAtY(_arg_1:int):_SafeStr_3281
        {
            for each (var _local_2:_SafeStr_3281 in _SafeStr_5263)
            {
                if (((_arg_1 >= _local_2.y) && (_arg_1 <= (_local_2.y + _local_2.height))))
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        private function mouseDragEventHandler(_arg_1:Event):void
        {
            var _local_5:int;
            var _local_4:int;
            var _local_3:* = null;
            if (((!(_rootDisplayObject)) || (!(_rootDisplayObject.stage))))
            {
                return;
            };
            var _local_2:MouseEvent = MouseEvent(_arg_1);
            switch (_local_2.type)
            {
                case "mouseDown":
                    if (((_local_2.stageY < (_rootDisplayObject.y + _SafeStr_5265.height)) && (_local_2.stageX < _scrollBar.displayObject.x)))
                    {
                        _scrollBar.endScroll();
                        _SafeStr_5266 = _local_2.stageY;
                        _SafeStr_5267 = topY;
                        _SafeStr_4888.addEventListener("mouseMove", mouseDragEventHandler, true);
                        _SafeStr_4888.addEventListener("mouseUp", mouseDragEventHandler);
                    };
                    return;
                case "mouseMove":
                    _local_5 = (_local_2.stageY - _SafeStr_5266);
                    topY = (_SafeStr_5267 - _local_5);
                    _arg_1.stopImmediatePropagation();
                    return;
                case "mouseUp":
                    _SafeStr_4888.removeEventListener("mouseMove", mouseDragEventHandler, true);
                    _SafeStr_4888.removeEventListener("mouseUp", mouseDragEventHandler);
                    _local_4 = (_local_2.stageY - _SafeStr_5266);
                    if (((_local_4 < 1) && (_local_4 > -1)))
                    {
                        if (hitIgnore(_local_2.stageX, _local_2.stageY)) break;
                        _local_3 = findSpriteAtY(_local_2.stageY);
                        if (_local_3)
                        {
                            onEntrySpriteClicked(_local_3);
                            moveIgnore(_local_3);
                        };
                    };
                    return;
            };
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            var _local_2:Stage = _rootDisplayObject.stage;
            viewPort = new Rectangle(0, 0, _local_2.stageWidth, (_local_2.stageHeight - 50));
        }

        private function onStageResized(_arg_1:Event):void
        {
            if (_SafeStr_4888)
            {
                viewPort = new Rectangle(0, 0, _SafeStr_4888.stageWidth, (_SafeStr_4888.stageHeight - 50));
            };
        }

        private function onEntrySpriteClicked(_arg_1:_SafeStr_3281):void
        {
            if (!_SafeStr_4147)
            {
                return;
            };
            _SafeStr_4147.selectAvatar(_arg_1.roomId, _arg_1.userId);
        }

        private function moveIgnore(_arg_1:_SafeStr_3281):void
        {
            if (((!(_SafeStr_4147)) || (_arg_1 == _SafeStr_5264)))
            {
                return;
            };
            if (((!(_arg_1.canIgnore)) || (_SafeStr_4147.sessionDataManager.isIgnored(_arg_1.userName))))
            {
                if (_SafeStr_5264 != null)
                {
                    _rootDisplayObject.removeChild(_ignore);
                    _SafeStr_5264 = null;
                };
                return;
            };
            _ignore.x = ((_arg_1.x + _arg_1.width) + 5);
            _ignore.y = (_arg_1.y + ((_arg_1.height - _ignore.height) / 2));
            _rootDisplayObject.addChild(_ignore);
            _SafeStr_5264 = _arg_1;
        }

        private function hitIgnore(_arg_1:int, _arg_2:int):Boolean
        {
            if ((((((_SafeStr_5264 == null) || (_arg_1 < _ignore.x)) || (_arg_1 > (_ignore.x + _ignore.width))) || (_arg_2 < _ignore.y)) || (_arg_2 > (_ignore.y + _ignore.height))))
            {
                return (false);
            };
            _SafeStr_4147.localizations.registerParameter("chat.ignore_user.confirm.info", "username", _SafeStr_5264.userName);
            var _local_4:String = _SafeStr_4147.localizations.getLocalization("chat.ignore_user.confirm.title");
            var _local_3:String = _SafeStr_4147.localizations.getLocalization("chat.ignore_user.confirm.info");
            _SafeStr_4147.windowManager.confirmWithModal(_local_4, _local_3, 0, ignoreConfirmDialogEventProcessor);
            return (true);
        }

        private function ignoreConfirmDialogEventProcessor(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            if (_arg_2.type == "WE_OK")
            {
                _SafeStr_4147.sessionDataManager.ignoreUser(_SafeStr_5264.userName);
            };
            if (_SafeStr_5264 != null)
            {
                _rootDisplayObject.removeChild(_ignore);
                _SafeStr_5264 = null;
            };
        }


    }
}//package com.sulake.habbo.freeflowchat.history.visualization

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3280 = "_-mJ" (String#4458, DoABC#4)
// _SafeStr_3281 = "_-01j" (String#4148, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4495 = "_-b12" (String#2547, DoABC#4)
// _SafeStr_4537 = "_-ob" (String#2302, DoABC#4)
// _SafeStr_4888 = "_-b1R" (String#2081, DoABC#4)
// _SafeStr_5262 = "_-Z" (String#11119, DoABC#4)
// _SafeStr_5263 = "_-T1a" (String#3869, DoABC#4)
// _SafeStr_5264 = "_-r1w" (String#3496, DoABC#4)
// _SafeStr_5265 = "_-02D" (String#10249, DoABC#4)
// _SafeStr_5266 = "_-d1b" (String#5796, DoABC#4)
// _SafeStr_5267 = "_-X1j" (String#15984, DoABC#4)


