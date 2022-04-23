// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubExtendConfirmationDialog

package com.sulake.habbo.catalog.club
{
    import com.sulake.core.window.components._SafeStr_3263;
    import _-AE._SafeStr_1541;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.assets.XmlAsset;

    public class ClubExtendConfirmationDialog 
    {

        private static const CREDIT_IMAGE_COUNT:int = 7;
        private static const YOUR_PRICE_ICON_BITMAP_ELEMENT_NAME:String = "your_price_icon_left";
        private static const _SafeStr_8309:String = "${image.library.catalogue.url}catalogue/vip_extend_tsr.png";
        private static const TEASER_IMAGE_MIME_TYPE:String = "image/png";
        private static const ANIMATION_TRIGGER_INTERVAL:int = 2000;
        private static const _SafeStr_8310:int = 75;
        private static const LINK_COLOR_DEFAULT:uint = 0;
        private static const LINK_COLOR_HOVER:uint = 9552639;

        private var _SafeStr_4360:ClubExtendController;
        private var _SafeStr_3882:_SafeStr_3263;
        private var _offer:_SafeStr_1541;
        private var _maybeLaterRegion:IRegionWindow;
        private var _SafeStr_5758:ITextWindow;
        private var _SafeStr_5759:_SafeStr_3264;
        private var _SafeStr_5760:Vector.<BitmapData>;
        private var _SafeStr_5761:Timer;
        private var _SafeStr_5762:Timer;
        private var _animationFrame:int = 0;
        private var _SafeStr_5763:int = 0;
        private var _disposed:Boolean = false;
        private var _localizationKey:String = "catalog.club.extend.";

        public function ClubExtendConfirmationDialog(_arg_1:ClubExtendController, _arg_2:_SafeStr_1541)
        {
            _SafeStr_4360 = _arg_1;
            _offer = _arg_2;
            _SafeStr_5760 = new Vector.<BitmapData>(7);
        }

        public function dispose():void
        {
            var _local_1:int;
            if (_disposed)
            {
                return;
            };
            _offer = null;
            _SafeStr_4360 = null;
            clearAnimation();
            if (_maybeLaterRegion)
            {
                _maybeLaterRegion.removeEventListener("WME_OUT", onMouseOutLaterRegion);
                _maybeLaterRegion.removeEventListener("WME_OVER", onMouseOverLaterRegion);
                _maybeLaterRegion = null;
            };
            if (_SafeStr_5758)
            {
                _SafeStr_5758 = null;
            };
            if (_SafeStr_5759)
            {
                _SafeStr_5759 = null;
            };
            if (_SafeStr_5760)
            {
                while (_local_1 < 7)
                {
                    _SafeStr_5760[_local_1].dispose();
                    _SafeStr_5760[_local_1] = null;
                    _local_1++;
                };
                _SafeStr_5760 = null;
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _disposed = true;
        }

        public function showConfirmation():void
        {
            var _local_10:* = null;
            var _local_11:* = null;
            var _local_8:int;
            var _local_6:* = null;
            var _local_12:* = null;
            if ((((!(_offer)) || (!(_SafeStr_4360))) || (_disposed)))
            {
                return;
            };
            _SafeStr_3882 = (createWindow("club_extend_confirmation") as _SafeStr_3263);
            if (!_SafeStr_3882)
            {
                return;
            };
            _SafeStr_3882.procedure = windowEventHandler;
            _SafeStr_3882.center();
            if (!_offer.vip)
            {
                _localizationKey = (_localizationKey + "basic.");
                _local_10 = (_SafeStr_3882.findChildByName("club_level_icon") as IIconWindow);
                if (_local_10)
                {
                    _local_10.style = 17;
                    _local_10.x = (_local_10.x + 15);
                };
            };
            var _local_3:_SafeStr_18 = _SafeStr_4360.localization;
            _SafeStr_3882.findChildByName("normal_price_price_left").caption = _offer.originalPrice.toString();
            _SafeStr_3882.findChildByName("normal_price_price_right").caption = _offer.originalActivityPointPrice.toString();
            _SafeStr_3882.findChildByName("you_save_price_left").caption = _offer.discountCreditAmount.toString();
            _SafeStr_3882.findChildByName("you_save_price_right").caption = _offer.discountActivityPointAmount.toString();
            _SafeStr_3882.findChildByName("your_price_price_left").caption = _offer.priceCredits.toString();
            _SafeStr_3882.findChildByName("your_price_price_right").caption = _offer.priceActivityPoints.toString();
            _SafeStr_3882.title.caption = _local_3.getLocalization((_localizationKey + "confirm.caption"));
            _SafeStr_3882.findChildByName("extend_title").caption = _local_3.getLocalization((_localizationKey + "confirm.title"));
            _SafeStr_3882.findChildByName("normal_price_label").caption = _local_3.getLocalization((_localizationKey + "normal.label"));
            _SafeStr_3882.findChildByName("you_save_label").caption = _local_3.getLocalization((_localizationKey + "save.label"));
            _SafeStr_3882.findChildByName("your_price_label").caption = _local_3.getLocalization((_localizationKey + "price.label"));
            _SafeStr_3882.findChildByName("buy_now_button").caption = _local_3.getLocalization((_localizationKey + "buy.button"));
            _SafeStr_3882.findChildByName("maybe_later_link").caption = _local_3.getLocalization((_localizationKey + "later.link"));
            if (_offer.subscriptionDaysLeft > 1)
            {
                _local_3.registerParameter((_localizationKey + "expiration_days_left"), "day", _offer.subscriptionDaysLeft.toString());
                _local_3.registerParameter((_localizationKey + "expiration_days_left"), "duration", (31 * _offer.months).toString());
                _local_11 = _local_3.getLocalization((_localizationKey + "expiration_days_left"));
            }
            else
            {
                _local_11 = _local_3.getLocalization((_localizationKey + "expires_today"));
            };
            _SafeStr_3882.findChildByName("offer_expiration").caption = _local_11;
            _maybeLaterRegion = (_SafeStr_3882.findChildByName("maybe_later_region") as IRegionWindow);
            _SafeStr_5758 = (_SafeStr_3882.findChildByName("maybe_later_link") as ITextWindow);
            if (((!(_maybeLaterRegion)) || (!(_SafeStr_5758))))
            {
                return;
            };
            _maybeLaterRegion.addEventListener("WME_OUT", onMouseOutLaterRegion);
            _maybeLaterRegion.addEventListener("WME_OVER", onMouseOverLaterRegion);
            var _local_5:BitmapData = getBitmapDataFromAsset("icon_credit_0");
            setElementBitmapData("normal_price_icon_left", _local_5);
            setElementBitmapData("you_save_icon_left", _local_5);
            setActivityPointIconStyle("normal_price_icon_right");
            setActivityPointIconStyle("you_save_icon_right");
            setActivityPointIconStyle("your_price_icon_right");
            var _local_1:_SafeStr_3264 = (_SafeStr_3882.findChildByName("club_teaser") as _SafeStr_3264);
            _local_1.x = 1;
            _local_1.y = (_SafeStr_3882.height - 144);
            _local_1.height = 144;
            _local_1.width = 133;
            var _local_7:String = _SafeStr_4360.config.interpolate("${image.library.catalogue.url}catalogue/vip_extend_tsr.png");
            if (_SafeStr_4360.config)
            {
                _local_7 = _SafeStr_4360.config.updateUrlProtocol(_local_7);
            };
            loadAssetFromUrl("club_teaser", "club_teaser", _local_7, "image/png", onTeaserLoaded);
            var _local_9:IItemListWindow = (_SafeStr_3882.findChildByName("itemlist_vertical") as IItemListWindow);
            if (!_local_9)
            {
                return;
            };
            var _local_4:_SafeStr_3133 = (_SafeStr_3882.findChildByName("total_amount_line") as _SafeStr_3133);
            if (!_local_4)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_SafeStr_3882.findChildByName("background_container") as _SafeStr_3133);
            if (!_local_2)
            {
                return;
            };
            _local_2.height = ((_local_9.y + _local_4.height) + _local_4.y);
            _SafeStr_5759 = (_SafeStr_3882.findChildByName("your_price_icon_left") as _SafeStr_3264);
            if (_SafeStr_5759 == null)
            {
                return;
            };
            _local_8 = 0;
            while (_local_8 < 7)
            {
                _local_6 = (_SafeStr_4360.assets.getAssetByName(("icon_credit_" + _local_8)) as BitmapDataAsset);
                _local_12 = (_local_6.content as BitmapData);
                _SafeStr_5760[_local_8] = _local_12.clone();
                _local_8++;
            };
            startAnimation();
        }

        private function setActivityPointIconStyle(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _SafeStr_3882.findChildByName(_arg_1);
            _local_2.style = _SafeStr_3226.getIconStyleFor(_offer.originalActivityPointType, _SafeStr_4360.config, true);
        }

        private function onMouseOutLaterRegion(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5758)
            {
                _SafeStr_5758.textColor = 0;
            };
        }

        private function onMouseOverLaterRegion(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5758)
            {
                _SafeStr_5758.textColor = 9552639;
            };
        }

        private function startAnimation():void
        {
            if (_SafeStr_5761)
            {
                clearAnimation();
            };
            setAnimationFrame();
            _SafeStr_5761 = new Timer(2000);
            _SafeStr_5761.addEventListener("timer", onAnimationTrigger);
            _SafeStr_5761.start();
        }

        private function clearAnimation():void
        {
            _animationFrame = 0;
            _SafeStr_5763 = 0;
            if (_SafeStr_5762)
            {
                _SafeStr_5762.stop();
                _SafeStr_5762 = null;
            };
            if (_SafeStr_5761)
            {
                _SafeStr_5761.stop();
                _SafeStr_5761 = null;
            };
        }

        private function setAnimationFrame():void
        {
            if (!_SafeStr_5759)
            {
                return;
            };
            if (_SafeStr_5759.bitmap)
            {
                _SafeStr_5759.bitmap.dispose();
            };
            if (_animationFrame < 7)
            {
                _SafeStr_5759.bitmap = new BitmapData(_SafeStr_5759.width, _SafeStr_5759.height, true, 0);
                _SafeStr_5759.bitmap.copyPixels(_SafeStr_5760[_animationFrame], _SafeStr_5760[_animationFrame].rect, new Point(0, 0));
            }
            else
            {
                _SafeStr_14.log(("Animation frame " + _animationFrame));
            };
        }

        private function startAnimationFrame():void
        {
            _SafeStr_5762 = new Timer(75, (7 - 1));
            _SafeStr_5762.addEventListener("timer", onAnimationFrame);
            _SafeStr_5762.addEventListener("timerComplete", onAnimationFrameComplete);
            _SafeStr_5762.start();
        }

        private function onAnimationTrigger(_arg_1:TimerEvent):void
        {
            startAnimationFrame();
        }

        private function onAnimationFrame(_arg_1:TimerEvent):void
        {
            _animationFrame = (_animationFrame + 1);
            setAnimationFrame();
        }

        private function onAnimationFrameComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5762)
            {
                _SafeStr_5762.stop();
                _SafeStr_5762 = null;
            };
            _animationFrame = 0;
            setAnimationFrame();
            if (_SafeStr_5763 == 0)
            {
                _SafeStr_5763 = 1;
                startAnimationFrame();
            }
            else
            {
                _SafeStr_5763 = 0;
            };
        }

        private function getBitmapDataFromAsset(_arg_1:String):BitmapData
        {
            var _local_2:BitmapDataAsset = (_SafeStr_4360.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_2 != null)
            {
                return (_local_2.content as BitmapData);
            };
            return (null);
        }

        private function setElementBitmapData(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:_SafeStr_3264 = (_SafeStr_3882.findChildByName(_arg_1) as _SafeStr_3264);
            if (_local_3.bitmap != null)
            {
                _local_3.bitmap.dispose();
            };
            if (((!(_arg_2 == null)) && (!(_local_3 == null))))
            {
                if (_local_3.width != _arg_2.width)
                {
                    _local_3.width = _arg_2.width;
                };
                if (_local_3.height != _arg_2.height)
                {
                    _local_3.height = _arg_2.height;
                };
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            };
        }

        private function loadAssetFromUrl(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Function):Boolean
        {
            var _local_8:BitmapData = getBitmapDataFromAsset(_arg_2);
            if (_local_8 != null)
            {
                setElementBitmapData(_arg_1, _local_8);
                return (true);
            };
            var _local_6:URLRequest = new URLRequest(_arg_3);
            var _local_7:AssetLoaderStruct = _SafeStr_4360.assets.loadAssetFromFile(_arg_2, _local_6, _arg_4);
            if (!_local_7)
            {
                return (false);
            };
            _local_7.addEventListener("AssetLoaderEventComplete", _arg_5);
            return (true);
        }

        private function onTeaserLoaded(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (!_disposed)
            {
                _local_2 = (_arg_1.target as AssetLoaderStruct);
                if (_local_2 != null)
                {
                    _local_3 = getBitmapDataFromAsset(_local_2.assetName);
                    setElementBitmapData("club_teaser", _local_3);
                };
            };
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((((!(_arg_1)) || (!(_arg_2))) || (!(_SafeStr_4360))) || (!(_offer))) || (_disposed)))
            {
                return;
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "buy_now_button":
                    _SafeStr_4360.confirmSelection();
                    return;
                case "header_button_close":
                case "maybe_later_region":
                    _SafeStr_4360.closeConfirmation();
                    return;
            };
        }

        private function createWindow(_arg_1:String):_SafeStr_3109
        {
            if (((((!(_SafeStr_4360)) || (!(_SafeStr_4360.assets))) || (!(_SafeStr_4360.windowManager))) || (_disposed)))
            {
                return (null);
            };
            var _local_3:XmlAsset = (_SafeStr_4360.assets.getAssetByName(_arg_1) as XmlAsset);
            if (((!(_local_3)) || (!(_local_3.content))))
            {
                return (null);
            };
            var _local_2:XML = (_local_3.content as XML);
            if (!_local_2)
            {
                return (null);
            };
            return (_SafeStr_4360.windowManager.buildFromXML(_local_2));
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1541 = "_-51r" (String#23471, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5758 = "_-Zp" (String#6642, DoABC#4)
// _SafeStr_5759 = "_-kG" (String#5308, DoABC#4)
// _SafeStr_5760 = "_-22H" (String#6622, DoABC#4)
// _SafeStr_5761 = "_-yF" (String#7482, DoABC#4)
// _SafeStr_5762 = "_-AV" (String#5264, DoABC#4)
// _SafeStr_5763 = "_-Tz" (String#10067, DoABC#4)
// _SafeStr_8309 = "_-M1w" (String#38618, DoABC#4)
// _SafeStr_8310 = "_-D1" (String#39737, DoABC#4)


