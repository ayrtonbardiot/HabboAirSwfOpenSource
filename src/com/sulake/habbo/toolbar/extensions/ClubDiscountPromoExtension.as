// by nota

//com.sulake.habbo.toolbar.extensions.ClubDiscountPromoExtension

package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.utils.Timer;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import _-qv._SafeStr_895;
    import _-q1n._SafeStr_870;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.core.window.components.IIconWindow;

    public class ClubDiscountPromoExtension 
    {

        private static const _SafeStr_8937:String = "club_promo";
        private static const ICON_STYLE_VIP:int = 14;
        private static const LINK_COLOR_NORMAL:uint = 0xFFFFFF;
        private static const LINK_COLOR_HIGHLIGHT:uint = 12247545;

        private var _toolbar:HabboToolbar;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _disposed:Boolean = false;
        private var _SafeStr_5402:_SafeStr_3264;
        private var _SafeStr_5155:Timer;
        private var _SafeStr_5405:int = 0;
        private var _animBlockMoveAmount:int;
        private var _SafeStr_5404:Timer;
        private var _SafeStr_5403:BitmapData;
        private var _SafeStr_4156:Timer;

        public function ClubDiscountPromoExtension(_arg_1:HabboToolbar)
        {
            _toolbar = _arg_1;
        }

        private function createWindow():_SafeStr_3133
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_1:_SafeStr_3133;
            var _local_3:XmlAsset = (_toolbar.assets.getAssetByName("club_discount_promotion_xml") as XmlAsset);
            if (_local_3)
            {
                _local_1 = (_toolbar.windowManager.buildFromXML((_local_3.content as XML), 1) as _SafeStr_3133);
                if (_local_1)
                {
                    _SafeStr_5402 = (_local_1.findChildByName("flashing_animation") as _SafeStr_3264);
                    if (_SafeStr_5402)
                    {
                        _local_4 = (_toolbar.assets.getAssetByName("extend_hilite_png") as IAsset);
                        if (_local_4)
                        {
                            _SafeStr_5403 = (_local_4.content as BitmapData);
                            if (_SafeStr_5403)
                            {
                                _SafeStr_5402.bitmap = _SafeStr_5403.clone();
                            };
                        };
                        _SafeStr_5402.visible = false;
                    };
                    _local_2 = (_local_1.findChildByName("text_region") as IRegionWindow);
                    if (_local_2)
                    {
                        _local_2.addEventListener("WME_CLICK", onTextRegionClicked);
                        _local_2.addEventListener("WME_OVER", onTextRegionMouseOver);
                        _local_2.addEventListener("WME_OUT", onTextRegionMouseOut);
                    };
                    assignState();
                };
            };
            return (_local_1);
        }

        private function destroyWindow():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
                _SafeStr_5402 = null;
            };
            animate(false);
            destroyExpirationTimer();
        }

        public function dispose():void
        {
            if (((_disposed) || (!(_toolbar))))
            {
                return;
            };
            if (_toolbar.extensionView)
            {
                _toolbar.extensionView.detachExtension("club_promo");
            };
            clearAnimation();
            destroyWindow();
            _toolbar = null;
            _disposed = true;
        }

        private function onTextRegionClicked(_arg_1:WindowMouseEvent):void
        {
            if (_toolbar.inventory.clubLevel == 2)
            {
                _toolbar.connection.send(new _SafeStr_895("DiscountPromo", "discount", "client.club.extend.discount.clicked"));
                _toolbar.connection.send(new _SafeStr_870());
            };
        }

        private function assignState():void
        {
            switch (_toolbar.inventory.clubLevel)
            {
                case 0:
                    setText("${discount.bar.no.club.promo}");
                    setClubIcon(14);
                    break;
                case 2:
                    setText("${discount.bar.vip.expiring}");
                    setClubIcon(14);
                default:
            };
            animate(true);
        }

        public function onClubChanged(_arg_1:HabboInventoryHabboClubEvent):void
        {
            if ((((_toolbar.inventory.clubIsExpiring) && (!(_SafeStr_3882))) && (isExtensionEnabled())))
            {
                _SafeStr_3882 = createWindow();
                if (_SafeStr_4156 != null)
                {
                    destroyExpirationTimer();
                };
                if (((_toolbar.inventory.clubMinutesUntilExpiration < 1440) && (_toolbar.inventory.clubMinutesUntilExpiration > 0)))
                {
                    _SafeStr_4156 = new Timer(((_toolbar.inventory.clubMinutesUntilExpiration * 60) * 1000), 1);
                    _SafeStr_4156.addEventListener("timerComplete", onExtendOfferExpire);
                    _SafeStr_4156.start();
                };
                assignState();
                _toolbar.extensionView.attachExtension("club_promo", _SafeStr_3882, 10);
            }
            else
            {
                _toolbar.extensionView.detachExtension("club_promo");
                destroyWindow();
            };
        }

        private function destroyExpirationTimer():void
        {
            if (_SafeStr_4156)
            {
                _SafeStr_4156.stop();
                _SafeStr_4156.removeEventListener("timerComplete", onExtendOfferExpire);
                _SafeStr_4156 = null;
            };
        }

        private function onExtendOfferExpire(_arg_1:TimerEvent):void
        {
            _toolbar.extensionView.detachExtension("club_promo");
            destroyWindow();
        }

        private function isExtensionEnabled():Boolean
        {
            if (((_toolbar.inventory.clubLevel == 2) && (_toolbar.getBoolean("club.membership.extend.vip.promotion.enabled"))))
            {
                return (true);
            };
            return (false);
        }

        private function setText(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_SafeStr_3882)
            {
                _local_2 = (_SafeStr_3882.findChildByName("promo_text") as ITextWindow);
                _local_3 = (_SafeStr_3882.findChildByName("promo_text_shadow") as ITextWindow);
                if (_local_2)
                {
                    _local_2.text = _arg_1;
                };
                if (_local_3)
                {
                    _local_3.text = _arg_1;
                };
            };
        }

        private function animate(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _SafeStr_14.log("Animate window");
                if (_SafeStr_5404)
                {
                    _SafeStr_5404.stop();
                };
                _SafeStr_5404 = new Timer(15000);
                _SafeStr_5404.addEventListener("timer", onTriggerTimer);
                _SafeStr_5404.start();
            }
            else
            {
                if (_SafeStr_5404)
                {
                    _SafeStr_5404.stop();
                    _SafeStr_5404 = null;
                };
                clearAnimation();
            };
        }

        private function clearAnimation():void
        {
            if (_SafeStr_5402)
            {
                _SafeStr_5402.visible = false;
                _SafeStr_5402.bitmap = null;
                _SafeStr_5402 = null;
                _SafeStr_3882.invalidate();
                if (_SafeStr_5155)
                {
                    _SafeStr_5155.stop();
                    _SafeStr_5155 = null;
                };
            };
        }

        private function onTriggerTimer(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5402)
            {
                if (_SafeStr_5402.context)
                {
                    _SafeStr_5402.visible = true;
                    resetAnimationVariables();
                    startAnimationTimer();
                };
            };
        }

        private function resetAnimationVariables():void
        {
            _SafeStr_5402.x = 3;
            _SafeStr_5402.y = 3;
            _SafeStr_5402.bitmap = _SafeStr_5403.clone();
            _SafeStr_5402.height = (_SafeStr_3882.height - 6);
            _SafeStr_5402.width = _SafeStr_5402.bitmap.width;
            _SafeStr_5402.invalidate();
            _animBlockMoveAmount = ((_SafeStr_3882.width - 7) - _SafeStr_5402.bitmap.width);
            _SafeStr_5405 = 0;
        }

        private function startAnimationTimer():void
        {
            _SafeStr_5155 = new Timer(25, 26);
            _SafeStr_5155.addEventListener("timer", onAnimationTimer);
            _SafeStr_5155.addEventListener("timerComplete", onAnimationTimerComplete);
            _SafeStr_5155.start();
        }

        private function onAnimationTimer(_arg_1:TimerEvent):void
        {
            var _local_2:int;
            var _local_3:* = null;
            if (_SafeStr_5402)
            {
                _SafeStr_5402.x = (3 + ((_SafeStr_5405 / 20) * _animBlockMoveAmount));
                if (_SafeStr_5402.x > _animBlockMoveAmount)
                {
                    _local_2 = ((_SafeStr_3882.width - 4) - _SafeStr_5402.x);
                    _local_3 = new BitmapData(_local_2, _SafeStr_5403.height);
                    _local_3.copyPixels(_SafeStr_5403, new Rectangle(0, 0, _local_2, _SafeStr_5403.height), new Point(0, 0));
                    _SafeStr_5402.bitmap = _local_3;
                    _SafeStr_5402.width = _local_2;
                };
                _SafeStr_5402.invalidate();
                _SafeStr_5405++;
            };
        }

        private function onAnimationTimerComplete(_arg_1:TimerEvent):void
        {
            clearAnimation();
        }

        private function setClubIcon(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_3882)
            {
                _local_2 = (_SafeStr_3882.findChildByName("club_icon") as IIconWindow);
                if (_local_2)
                {
                    _local_2.style = _arg_1;
                    _local_2.invalidate();
                };
            };
        }

        private function onTextRegionMouseOver(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_3882)
            {
                _local_2 = (_SafeStr_3882.findChildByName("promo_text") as ITextWindow);
                _local_2.textColor = 12247545;
            };
        }

        private function onTextRegionMouseOut(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_3882)
            {
                _local_2 = (_SafeStr_3882.findChildByName("promo_text") as ITextWindow);
                _local_2.textColor = 0xFFFFFF;
            };
        }


    }
}//package com.sulake.habbo.toolbar.extensions

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4156 = "_-q6" (String#3542, DoABC#4)
// _SafeStr_5155 = "_-Sg" (String#3605, DoABC#4)
// _SafeStr_5402 = "_-W1V" (String#2684, DoABC#4)
// _SafeStr_5403 = "_-y12" (String#8232, DoABC#4)
// _SafeStr_5404 = "_-i1w" (String#6676, DoABC#4)
// _SafeStr_5405 = "_-qI" (String#10865, DoABC#4)
// _SafeStr_870 = "_-YX" (String#19317, DoABC#4)
// _SafeStr_8937 = "_-71F" (String#31536, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


