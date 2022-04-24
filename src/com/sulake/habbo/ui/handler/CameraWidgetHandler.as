// by nota

//com.sulake.habbo.ui.handler.CameraWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.camera.CameraWidget;
    import _-du._SafeStr_333;
    import _-du._SafeStr_1032;
    import _-du._SafeStr_450;
    import _-du._SafeStr_505;
    import _-du._SafeStr_584;
    import com.sulake.habbo.ui.RoomDesktop;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_857;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_940;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_1006;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_919;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_687;

    public class CameraWidgetHandler implements IRoomWidgetHandler, _SafeStr_13 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:CameraWidget;
        private var _SafeStr_5438:_SafeStr_333;
        private var _SafeStr_5439:_SafeStr_1032;
        private var _SafeStr_5440:_SafeStr_450;
        private var _SafeStr_5441:_SafeStr_505;
        private var _SafeStr_5442:_SafeStr_584;
        private var _SafeStr_5437:RoomDesktop;
        private var _SafeStr_5434:int = 999;
        private var _SafeStr_5435:int = 999;
        private var _SafeStr_5436:int = 999;

        public function CameraWidgetHandler(_arg_1:RoomDesktop)
        {
            _SafeStr_5437 = _arg_1;
        }

        public function get creditPrice():int
        {
            return (_SafeStr_5434);
        }

        public function get ducketPrice():int
        {
            return (_SafeStr_5435);
        }

        public function get publishDucketPrice():int
        {
            return (_SafeStr_5436);
        }

        public function get type():String
        {
            return ("RWE_CAMERA");
        }

        public function get roomDesktop():RoomDesktop
        {
            return (_SafeStr_5437);
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            if (((_container) && (_container.toolbar)))
            {
                _container.toolbar.events.removeEventListener("HTE_ICON_CAMERA", onCameraRequested);
            };
            _container = _arg_1;
            if (((_container) && (_container.toolbar)))
            {
                _container.toolbar.events.addEventListener("HTE_ICON_CAMERA", onCameraRequested);
            };
            _SafeStr_5438 = new _SafeStr_333(onCameraStorageUrlEvent);
            _SafeStr_5439 = new _SafeStr_1032(onPurchaseOK);
            _SafeStr_5440 = new _SafeStr_450(onPublishStatus);
            _SafeStr_5441 = new _SafeStr_505(onCompetitionStatus);
            _SafeStr_5442 = new _SafeStr_584(onInitCameraEvent);
            _container.connection.addMessageEvent(_SafeStr_5438);
            _container.connection.addMessageEvent(_SafeStr_5439);
            _container.connection.addMessageEvent(_SafeStr_5440);
            _container.connection.addMessageEvent(_SafeStr_5441);
            _container.connection.addMessageEvent(_SafeStr_5442);
        }

        public function sendInitCameraMessage():void
        {
            if (_container.sessionDataManager.isPerkAllowed("CAMERA"))
            {
                _container.connection.send(new _SafeStr_857());
            };
        }

        private function onInitCameraEvent(_arg_1:_SafeStr_584):void
        {
            _SafeStr_5434 = _arg_1.getParser().getCreditPrice();
            _SafeStr_5435 = _arg_1.getParser().getDucketPrice();
            _SafeStr_5436 = _arg_1.getParser().getPublishDucketPrice();
        }

        private function onPurchaseOK(_arg_1:_SafeStr_1032):void
        {
            if (_SafeStr_4981)
            {
                _SafeStr_4981.purchaseSuccessful();
            };
        }

        private function onPublishStatus(_arg_1:_SafeStr_450):void
        {
            if (_SafeStr_4981)
            {
                _SafeStr_4981.publishingStatus(_arg_1);
            };
        }

        private function onCompetitionStatus(_arg_1:_SafeStr_505):void
        {
            if (_SafeStr_4981)
            {
                _SafeStr_4981.competitionStatus(_arg_1);
            };
        }

        private function onCameraStorageUrlEvent(_arg_1:_SafeStr_333):void
        {
            if (!_SafeStr_4981)
            {
                return;
            };
            var _local_2:String = _arg_1.getParser().url;
            _SafeStr_4981.setRenderedPhotoUrl(_local_2);
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function getWidgetMessages():Array
        {
            return (null);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return ([]);
        }

        public function processEvent(_arg_1:Event):void
        {
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (((_container) && (container.connection)))
            {
                _container.connection.removeMessageEvent(_SafeStr_5438);
                _container.connection.removeMessageEvent(_SafeStr_5439);
                _container.connection.removeMessageEvent(_SafeStr_5440);
                _container.connection.removeMessageEvent(_SafeStr_5441);
                _container.connection.removeMessageEvent(_SafeStr_5442);
            };
            _disposed = true;
            _container = null;
            _SafeStr_5437 = null;
            _SafeStr_4981 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set widget(_arg_1:CameraWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        private function onCameraRequested(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTE_ICON_CAMERA")
            {
                if (_SafeStr_4981)
                {
                    _SafeStr_4981.startTakingPhoto(_arg_1.iconName);
                };
            };
        }

        public function addListenerToStage(_arg_1:String, _arg_2:Function):void
        {
            _SafeStr_5437.addListenerToStage(_arg_1, _arg_2);
        }

        public function removeListenerFromStage(_arg_1:String, _arg_2:Function):void
        {
            _SafeStr_5437.removeListenerFromStage(_arg_1, _arg_2);
        }

        public function confirmPhotoPurchase():void
        {
            _container.connection.send(new _SafeStr_940());
        }

        public function confirmPhotoPublish():void
        {
            _container.connection.send(new _SafeStr_1006());
        }

        public function confirmPhotoCompetitionSubmit():void
        {
            _container.connection.send(new _SafeStr_919());
        }

        public function collectPhotoData():_SafeStr_687
        {
            return (_SafeStr_5437.roomEngine.getRenderRoomMessage(_SafeStr_4981.getViewPort(), _SafeStr_5437.roomBackgroundColor) as _SafeStr_687);
        }

        public function sendPhotoData(_arg_1:_SafeStr_687):void
        {
            _container.connection.send(_arg_1);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1006 = "_-61e" (String#31082, DoABC#4)
// _SafeStr_1032 = "_-4Z" (String#22201, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_333 = "_-RD" (String#18632, DoABC#4)
// _SafeStr_450 = "_-02z" (String#10678, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_505 = "_-xc" (String#10837, DoABC#4)
// _SafeStr_5434 = "_-Q1k" (String#20990, DoABC#4)
// _SafeStr_5435 = "_-P1y" (String#21142, DoABC#4)
// _SafeStr_5436 = "_-a1O" (String#16188, DoABC#4)
// _SafeStr_5437 = "_-w11" (String#3640, DoABC#4)
// _SafeStr_5438 = "_-wU" (String#14267, DoABC#4)
// _SafeStr_5439 = "_-SH" (String#14774, DoABC#4)
// _SafeStr_5440 = "_-J1k" (String#15719, DoABC#4)
// _SafeStr_5441 = "_-nS" (String#14841, DoABC#4)
// _SafeStr_5442 = "_-M3" (String#14670, DoABC#4)
// _SafeStr_584 = "_-Ua" (String#19220, DoABC#4)
// _SafeStr_687 = "_-i1T" (String#7627, DoABC#4)
// _SafeStr_857 = "_-F1U" (String#30670, DoABC#4)
// _SafeStr_919 = "_-O1M" (String#31084, DoABC#4)
// _SafeStr_940 = "_-h1x" (String#30058, DoABC#4)


