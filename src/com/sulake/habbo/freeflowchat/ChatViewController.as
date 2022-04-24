// by nota

//com.sulake.habbo.freeflowchat.ChatViewController

package com.sulake.habbo.freeflowchat
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;
    import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;

    public class ChatViewController implements _SafeStr_13 
    {

        private var _rootDisplayObject:DisplayObjectContainer;
        private var _SafeStr_4888:Stage;
        private var _SafeStr_4147:HabboFreeFlowChat;
        private var _SafeStr_5254:ChatFlowViewer;
        private var _pulldown:ChatHistoryTray;
        private var _flowViewerDisplayObject:DisplayObject;
        private var _pulldownDisplayObject:DisplayObject;

        public function ChatViewController(_arg_1:HabboFreeFlowChat, _arg_2:ChatFlowViewer, _arg_3:ChatHistoryTray)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_5254 = _arg_2;
            _pulldown = _arg_3;
            _flowViewerDisplayObject = _SafeStr_5254.rootDisplayObject;
            _pulldownDisplayObject = _pulldown.rootDisplayObject;
            _rootDisplayObject = new Sprite();
            _rootDisplayObject.addChild(_flowViewerDisplayObject);
            _rootDisplayObject.addChild(_pulldownDisplayObject);
            _rootDisplayObject.addEventListener("addedToStage", onAddedToStage);
        }

        public function dispose():void
        {
            if (_rootDisplayObject)
            {
                _SafeStr_4147.removeUpdateReceiver(_pulldown);
                if (_SafeStr_4888)
                {
                    _SafeStr_4888.removeEventListener("resize", onStageResized);
                };
                _rootDisplayObject.removeChild(_pulldownDisplayObject);
                _rootDisplayObject.removeChild(_flowViewerDisplayObject);
                _rootDisplayObject.removeEventListener("addedToStage", onAddedToStage);
                _rootDisplayObject = null;
                _pulldownDisplayObject = null;
                _flowViewerDisplayObject = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_rootDisplayObject == null);
        }

        public function get rootDisplayObject():DisplayObject
        {
            return (_rootDisplayObject);
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            _SafeStr_4888 = _rootDisplayObject.stage;
            _SafeStr_4888.addEventListener("resize", onStageResized);
            _pulldown.resize(_SafeStr_4888.stageWidth, _SafeStr_4888.stageHeight);
            _SafeStr_4147.registerUpdateReceiver(_pulldown, 200);
        }

        private function onStageResized(_arg_1:Event):void
        {
            _pulldown.resize(_SafeStr_4888.stageWidth, _SafeStr_4888.stageHeight);
            _SafeStr_5254.resize(_SafeStr_4888.stageWidth, _SafeStr_4888.stageHeight);
        }


    }
}//package com.sulake.habbo.freeflowchat

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4888 = "_-b1R" (String#2081, DoABC#4)
// _SafeStr_5254 = "_-ZP" (String#14152, DoABC#4)


