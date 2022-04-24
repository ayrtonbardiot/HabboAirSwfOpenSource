// by nota

//com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer

package com.sulake.habbo.freeflowchat.viewer
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
    import flash.display.DisplayObjectContainer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.freeflowchat.viewer.visualization.PooledChatBubble;
    import flash.display.Sprite;
    import flash.geom.Point;

    public class ChatFlowViewer implements _SafeStr_13, _SafeStr_41 
    {

        private const VIEW_BOTTOM_DEFAULT:int = 230;

        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_3779:ChatFlowStage;
        private var _rootDisplayObject:DisplayObjectContainer;
        private var _SafeStr_4873:int;
        private var _SafeStr_4872:int = 0;
        private var _runTime:uint = 0;
        private var _SafeStr_4874:Number = 0.25;
        private var _SafeStr_4660:Vector.<PooledChatBubble> = new Vector.<PooledChatBubble>(0);
        private var _toRemove:Vector.<PooledChatBubble> = new Vector.<PooledChatBubble>(0);

        public function ChatFlowViewer(_arg_1:HabboFreeFlowChat, _arg_2:ChatFlowStage)
        {
            _rootDisplayObject = new Sprite();
            _SafeStr_4147 = _arg_1;
            _SafeStr_4147.registerUpdateReceiver(this, 1);
            _SafeStr_3779 = _arg_2;
        }

        public function dispose():void
        {
            if (_SafeStr_4147)
            {
                _SafeStr_4147.removeUpdateReceiver(this);
                _SafeStr_4147 = null;
            };
            _SafeStr_3779 = null;
            _rootDisplayObject = null;
        }

        public function get disposed():Boolean
        {
            return ((_rootDisplayObject == null) && (_SafeStr_4147 == null));
        }

        public function insertBubble(_arg_1:PooledChatBubble, _arg_2:Point):void
        {
            _arg_1.roomPanOffsetX = _SafeStr_4872;
            _SafeStr_4660.push(_arg_1);
            _rootDisplayObject.addChild(_arg_1);
            _arg_1.warpTo(_arg_2.x, _arg_2.y);
            _arg_1.repositionPointer();
            _SafeStr_4873 = _arg_1.roomId;
        }

        public function update(_arg_1:uint):void
        {
            var _local_6:int;
            _runTime = (_runTime + _arg_1);
            var _local_3:Point = _SafeStr_4147.roomEngine.getRoomCanvasScreenOffset(_SafeStr_4873);
            if (_local_3 != null)
            {
                if (((!(_local_3.x == _SafeStr_4872)) && (_SafeStr_4660.length > 0)))
                {
                    for each (var _local_2:PooledChatBubble in _SafeStr_4660)
                    {
                        _local_2.roomPanOffsetX = _local_3.x;
                    };
                };
                _SafeStr_4872 = _local_3.x;
            };
            for each (var _local_4:PooledChatBubble in _SafeStr_4660)
            {
                _local_4.update(_arg_1);
                if (_local_4.readyToRecycle)
                {
                    _toRemove.push(_local_4);
                };
            };
            if (_toRemove.length > 0)
            {
                for each (var _local_5:PooledChatBubble in _toRemove)
                {
                    _rootDisplayObject.removeChild(_local_5);
                    _local_6 = _SafeStr_4660.indexOf(_local_5);
                    _SafeStr_4660.splice(_local_6, 1);
                    _local_5.unregister();
                    _SafeStr_4147.chatBubbleFactory.recycle(_local_5);
                };
                _toRemove = new Vector.<PooledChatBubble>(0);
            };
        }

        public function get rootDisplayObject():DisplayObjectContainer
        {
            return (_rootDisplayObject);
        }

        public function get viewBottom():int
        {
            if (!_rootDisplayObject.stage)
            {
                return (230);
            };
            return (_rootDisplayObject.stage.stageHeight * _SafeStr_4874);
        }

        public function resize(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_3779)
            {
                _SafeStr_3779.resize(_arg_1, _arg_2);
            };
        }


    }
}//package com.sulake.habbo.freeflowchat.viewer

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3779 = "_-JE" (String#3505, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4660 = "_-22p" (String#1844, DoABC#4)
// _SafeStr_4872 = "_-A1p" (String#14154, DoABC#4)
// _SafeStr_4873 = "_-zr" (String#18510, DoABC#4)
// _SafeStr_4874 = "_-Pw" (String#28521, DoABC#4)


