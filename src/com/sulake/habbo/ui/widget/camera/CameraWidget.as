// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.camera.CameraWidget

package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.handler.CameraWidgetHandler;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.session.IRoomSession;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import _-du._SafeStr_450;
    import _-du._SafeStr_505;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_687;

    public class CameraWidget extends RoomWidgetBase 
    {

        private var _SafeStr_4147:RoomUI;
        private var _SafeStr_4934:CameraViewFinder;
        private var _SafeStr_4935:CameraPhotoLab;
        public var url:String;

        public function CameraWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_19, _arg_5:_SafeStr_18, _arg_6:RoomUI)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_5);
            _SafeStr_4147 = _arg_6;
            this.handler.widget = this;
            _SafeStr_4934 = new CameraViewFinder(this);
            if (roomEngine)
            {
                roomEngine.events.addEventListener("REE_DISPOSED", onRoomDisposed);
                roomEngine.events.addEventListener("REE_ROOM_ZOOMED", onRoomZoomed);
            };
            this.handler.sendInitCameraMessage();
            var _local_7:_SafeStr_2046 = this.handler.roomDesktop.questEngine;
            if (_local_7 != null)
            {
                _local_7.ensureAchievementsInitialized();
            };
        }

        public function get catalog():IHabboCatalog
        {
            return (_SafeStr_4147.catalog);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4934)
            {
                _SafeStr_4934.dispose();
                _SafeStr_4934 = null;
            };
            if (_SafeStr_4935)
            {
                _SafeStr_4935.dispose();
                _SafeStr_4935 = null;
            };
            super.dispose();
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return ((handler) ? handler.container : null);
        }

        public function get handler():CameraWidgetHandler
        {
            return (_SafeStr_3914 as CameraWidgetHandler);
        }

        public function get roomEngine():IRoomEngine
        {
            return ((container) ? container.roomEngine : null);
        }

        public function startTakingPhoto(_arg_1:String):void
        {
            if (((roomEngine) && (!(roomEngine.getRoomCanvasScale() == 1))))
            {
                windowManager.alert(_SafeStr_4020.getLocalization("camera.zoom.missing.header"), _SafeStr_4020.getLocalization("camera.zoom.missing.body"), 0, null);
                return;
            };
            if (component.getProperty("camera.effects.enabled") == "true")
            {
                CameraPhotoLab.preloadEffects(_SafeStr_4147.context.configuration.getProperty("image.library.url"), _SafeStr_4147.getProperty("camera.available.effects"), _SafeStr_4020);
            };
            if (_SafeStr_4935)
            {
                _SafeStr_4935.dispose();
            };
            _SafeStr_4934.toggleVisible(_arg_1);
        }

        public function get component():RoomUI
        {
            return (_SafeStr_4147);
        }

        public function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109;
            try
            {
                _local_5 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_3 = XmlAsset(_local_5);
                _local_4 = windowManager.buildFromXML(XML(_local_3.content), _arg_2);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_5) + ", ") + windowManager) + "!"));
                throw (e);
            };
            return (_local_4);
        }

        private function onRoomDisposed(_arg_1:RoomEngineEvent):void
        {
            hide();
        }

        private function onRoomZoomed(_arg_1:RoomEngineEvent):void
        {
            if (((roomEngine) && (!(roomEngine.getRoomCanvasScale() == 1))))
            {
                hide();
            };
        }

        private function hide():void
        {
            if (_SafeStr_4934)
            {
                _SafeStr_4934.hide();
            };
            if (_SafeStr_4935)
            {
                _SafeStr_4935.dispose();
            };
        }

        public function snapShotRoomCanvas(_arg_1:BitmapData, _arg_2:Matrix, _arg_3:Boolean):Boolean
        {
            var _local_4:IRoomSession = container.roomSession;
            return (roomEngine.snapshotRoomCanvasToBitmap(_local_4.roomId, container.getFirstCanvasId(), _arg_1, _arg_2, _arg_3));
        }

        public function triggetCameraShutterSound():void
        {
            container.soundManager.playSound("CAMERA_shutter");
        }

        public function editPhoto(_arg_1:BitmapData):void
        {
            _SafeStr_4935 = new CameraPhotoLab(this);
            _SafeStr_4935.openPhotoLab(_arg_1);
        }

        public function changeCaptionFieldText(_arg_1:String, _arg_2:Boolean=false):void
        {
            if (_SafeStr_4935)
            {
                _SafeStr_4935.setCaptionText(_arg_1);
                if (_arg_2)
                {
                    _SafeStr_4935.show();
                    _SafeStr_4935.closePurchaseConfirmation();
                };
            };
        }

        public function getViewPort():Rectangle
        {
            if (_SafeStr_4934)
            {
                return (_SafeStr_4934.getViewPort());
            };
            return (new Rectangle(0, 0, 0, 0));
        }

        public function purchaseSuccessful():void
        {
            if (_SafeStr_4935)
            {
                _SafeStr_4935.animateSuccessfulPurchase();
            };
        }

        public function setRenderedPhotoUrl(_arg_1:String):void
        {
            if (_SafeStr_4935)
            {
                _SafeStr_4935.setRenderedPhotoUrl(_arg_1);
            };
        }

        public function publishingStatus(_arg_1:_SafeStr_450):void
        {
            if (_SafeStr_4935)
            {
                _SafeStr_4935.publishingStatus(_arg_1);
            };
        }

        public function competitionStatus(_arg_1:_SafeStr_505):void
        {
            if (_SafeStr_4935)
            {
                _SafeStr_4935.competitionStatus(_arg_1);
            };
        }

        public function sendPhotoData():Boolean
        {
            var _local_1:_SafeStr_687 = _SafeStr_4934.getRenderRoomMessage();
            if (_SafeStr_4935)
            {
                _local_1.addEffectData(_SafeStr_4935.getEffectDataJson());
                _local_1.setZoom(_SafeStr_4935.getZoom());
            };
            _local_1.compressData();
            if (_local_1.isSendable())
            {
                handler.sendPhotoData(_local_1);
                return (true);
            };
            return (false);
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_450 = "_-02z" (String#10678, DoABC#4)
// _SafeStr_4934 = "_-F1S" (String#5562, DoABC#4)
// _SafeStr_4935 = "_-L9" (String#3065, DoABC#4)
// _SafeStr_505 = "_-xc" (String#10837, DoABC#4)
// _SafeStr_687 = "_-i1T" (String#7627, DoABC#4)


