// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.Product

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.catalog.HabboCatalog;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3133;

    public class Product extends ProductGridItem implements _SafeStr_3151, _SafeStr_3140 
    {

        public static const EFFECT_CLASSID_NINJA_DISAPPEAR:int = 108;

        private var _SafeStr_4890:String;
        private var _SafeStr_4710:int;
        private var _SafeStr_4131:String;
        private var _SafeStr_5386:int;
        private var _SafeStr_5387:_SafeStr_3182;
        private var _SafeStr_3867:_SafeStr_3130;
        private var _SafeStr_5388:Boolean;
        private var _SafeStr_5389:int;
        private var _SafeStr_5390:int;
        private var _SafeStr_4717:_SafeStr_3300;

        public function Product(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:_SafeStr_3182, _arg_6:_SafeStr_3130, _arg_7:HabboCatalog, _arg_8:Boolean=false, _arg_9:int=0, _arg_10:int=0)
        {
            super(_arg_7);
            _SafeStr_4890 = _arg_1;
            _SafeStr_4710 = _arg_2;
            _SafeStr_4131 = _arg_3;
            _SafeStr_5386 = _arg_4;
            _SafeStr_5387 = _arg_5;
            _SafeStr_3867 = _arg_6;
            _SafeStr_5388 = _arg_8;
            _SafeStr_5389 = _arg_9;
            _SafeStr_5390 = _arg_10;
        }

        public static function stripAddonProducts(_arg_1:Vector.<_SafeStr_3151>):Vector.<_SafeStr_3151>
        {
            var _local_2:* = null;
            if (_arg_1.length == 1)
            {
                return (_arg_1);
            };
            var _local_3:Vector.<_SafeStr_3151> = new Vector.<_SafeStr_3151>(0);
            for each (_local_2 in _arg_1)
            {
                if (((!(_local_2.productType == "b")) && (!((_local_2.productType == "e") && (_local_2.productClassId == 108)))))
                {
                    _local_3.push(_local_2);
                };
            };
            return (_local_3);
        }


        public function get productType():String
        {
            return (_SafeStr_4890);
        }

        public function get productClassId():int
        {
            return (_SafeStr_4710);
        }

        public function set extraParam(_arg_1:String):void
        {
            _SafeStr_4131 = _arg_1;
        }

        public function get extraParam():String
        {
            return (_SafeStr_4131);
        }

        public function get productCount():int
        {
            return (_SafeStr_5386);
        }

        public function get productData():_SafeStr_3182
        {
            return (_SafeStr_5387);
        }

        public function get furnitureData():_SafeStr_3130
        {
            return (_SafeStr_3867);
        }

        public function get isUniqueLimitedItem():Boolean
        {
            return (_SafeStr_5388);
        }

        public function get uniqueLimitedItemSeriesSize():int
        {
            return (_SafeStr_5389);
        }

        public function get uniqueLimitedItemsLeft():int
        {
            return (_SafeStr_5390);
        }

        public function set uniqueLimitedItemsLeft(_arg_1:int):void
        {
            _SafeStr_5390 = _arg_1;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4890 = "";
            _SafeStr_4710 = 0;
            _SafeStr_4131 = "";
            _SafeStr_5386 = 0;
            _SafeStr_5387 = null;
            _SafeStr_3867 = null;
            if (((catalog) && (catalog.sessionDataManager)))
            {
                catalog.sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", onBadgeImageReady);
            };
            super.dispose();
        }

        public function initIcon(_arg_1:_SafeStr_3300, _arg_2:_SafeStr_3140=null, _arg_3:_SafeStr_1875=null, _arg_4:_SafeStr_3141=null, _arg_5:_SafeStr_3264=null, _arg_6:IStuffData=null, _arg_7:Function=null):BitmapData
        {
            var _local_10:* = null;
            var _local_8:* = null;
            var _local_11:* = null;
            if (disposed)
            {
                return (null);
            };
            var _local_9:BitmapData;
            if (_arg_2 == null)
            {
                _arg_2 = this;
            };
            if ((_arg_1 is BundleGridViewCatalogWidget))
            {
                _local_10 = (_arg_1 as BundleGridViewCatalogWidget).offer.page.viewer.roomEngine;
            }
            else
            {
                _local_10 = (_arg_1 as ProductContainer).offer.page.viewer.roomEngine;
            };
            if (((!(_local_10)) || (!(catalog))))
            {
                return (null);
            };
            switch (_SafeStr_4890)
            {
                case "s":
                    _local_8 = _local_10.getFurnitureIcon(productClassId, _arg_2, null, _arg_6);
                    break;
                case "i":
                    if (((_arg_4) && (_SafeStr_3867)))
                    {
                        _local_11 = "";
                        switch (_SafeStr_3867.className)
                        {
                            case "floor":
                                _local_11 = ["th", _SafeStr_3867.className, _arg_4.product.extraParam].join("_");
                                break;
                            case "wallpaper":
                                _local_11 = ["th", "wall", _arg_4.product.extraParam].join("_");
                                break;
                            case "landscape":
                                _local_11 = ["th", _SafeStr_3867.className, _arg_4.product.extraParam.replace(".", "_"), "001"].join("_");
                                break;
                            default:
                                _local_8 = _local_10.getWallItemIcon(productClassId, _arg_2, _SafeStr_4131);
                        };
                        catalog.setImageFromAsset(_arg_5, _local_11, _arg_7);
                    }
                    else
                    {
                        _local_8 = _local_10.getWallItemIcon(productClassId, _arg_2, _SafeStr_4131);
                    };
                    break;
                case "e":
                    _local_9 = catalog.getPixelEffectIcon(productClassId);
                    if (_arg_2 == this)
                    {
                        this.setIconImage(_local_9, true);
                    };
                    break;
                case "h":
                    _local_9 = catalog.getSubscriptionProductIcon(productClassId);
                    break;
                case "b":
                    catalog.sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY", onBadgeImageReady);
                    _local_9 = catalog.sessionDataManager.getBadgeImage(_SafeStr_4131);
                    _SafeStr_4717 = _arg_1;
                    break;
                case "r":
                    _local_9 = renderAvatarImage(_SafeStr_4131, _arg_3);
                    setIconImage(_local_9, false);
                    break;
                default:
                    _SafeStr_14.log(("[Product] Can not yet handle this type of product: " + productType));
            };
            if (_local_8 != null)
            {
                _local_9 = _local_8.data;
                if (_arg_2 == this)
                {
                    this.setIconImage(_local_9, true);
                };
            };
            return (_local_9);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (!disposed)
            {
                setIconImage(_arg_2, true);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function onBadgeImageReady(_arg_1:BadgeImageReadyEvent):void
        {
            if (!disposed)
            {
                if (((_SafeStr_4890 == "b") && (_arg_1.badgeId == _SafeStr_4131)))
                {
                    ProductGridItem(_SafeStr_4717).setIconImage(_arg_1.badgeImage, false);
                    if (((catalog) && (catalog.sessionDataManager)))
                    {
                        catalog.sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", onBadgeImageReady);
                    };
                };
            };
        }

        public function get isColorable():Boolean
        {
            if (((_SafeStr_3867) && (_SafeStr_3867.fullName)))
            {
                return (!(_SafeStr_3867.fullName.indexOf("*") == -1));
            };
            return (false);
        }

        override public function set view(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (!_arg_1)
            {
                return;
            };
            super.view = _arg_1;
            if (_SafeStr_5386 > 1)
            {
                _local_2 = _SafeStr_3882.findChildByName("multiContainer");
                if (_local_2)
                {
                    _local_2.visible = true;
                };
                _local_3 = (_SafeStr_3882.findChildByName("multiCounter") as ITextWindow);
                if (_local_3)
                {
                    _local_3.text = ("x" + productCount);
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4131 = "_-p1c" (String#2883, DoABC#4)
// _SafeStr_4710 = "_-L1U" (String#4949, DoABC#4)
// _SafeStr_4717 = "_-wl" (String#3070, DoABC#4)
// _SafeStr_4890 = "_-91L" (String#3158, DoABC#4)
// _SafeStr_5386 = "_-c1B" (String#10280, DoABC#4)
// _SafeStr_5387 = "_-z1a" (String#3888, DoABC#4)
// _SafeStr_5388 = "_-01K" (String#18728, DoABC#4)
// _SafeStr_5389 = "_-32I" (String#19633, DoABC#4)
// _SafeStr_5390 = "_-M1O" (String#13576, DoABC#4)


