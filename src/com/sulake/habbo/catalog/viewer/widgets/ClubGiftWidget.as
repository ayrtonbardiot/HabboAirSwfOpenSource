// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubGiftController;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import _-AE._SafeStr_1406;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import _-AE._SafeStr_1611;
    import com.sulake.habbo.catalog.viewer.Product;
    import com.sulake.habbo.catalog.viewer.Offer;
    import _-AE._SafeStr_1537;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.habbo.catalog.viewer._SafeStr_3300;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;

    public class ClubGiftWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private const DAYS_IN_MONTH:int = 31;

        private var _SafeStr_4360:ClubGiftController;
        private var _offers:_SafeStr_24;
        private var _preview:_SafeStr_3133;
        private var _catalog:HabboCatalog;

        public function ClubGiftWidget(_arg_1:_SafeStr_3133, _arg_2:ClubGiftController, _arg_3:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_3;
            _SafeStr_4360 = _arg_2;
            _offers = new _SafeStr_24();
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_4360 = null;
            _catalog = null;
            if (_preview)
            {
                _preview.dispose();
                _preview = null;
            };
        }

        override public function init():Boolean
        {
            if (!window)
            {
                return (false);
            };
            if (!super.init())
            {
                return (false);
            };
            _SafeStr_4360.widget = this;
            attachWidgetView("clubGiftWidget");
            _window.findChildByName("info_text").caption = "";
            _window.findChildByName("past_club_days").caption = "";
            _window.findChildByName("past_vip_days").caption = "";
            update();
            return (true);
        }

        public function update():void
        {
            updateInfo();
            updateList();
        }

        private function updateInfo():void
        {
            var _local_6:* = null;
            var _local_4:int;
            var _local_1:int;
            var _local_5:int;
            if (((!(_SafeStr_4360)) || (!(window))))
            {
                return;
            };
            var _local_7:_SafeStr_3109 = window.findChildByName("info_text");
            if (!_local_7)
            {
                return;
            };
            if (_SafeStr_4360.giftsAvailable > 0)
            {
                _local_6 = "catalog.club_gift.available";
                _SafeStr_4360.localization.registerParameter(_local_6, "amount", _SafeStr_4360.giftsAvailable.toString());
            }
            else
            {
                if (_SafeStr_4360.daysUntilNextGift > 0)
                {
                    _local_6 = "catalog.club_gift.days_until_next";
                    _SafeStr_4360.localization.registerParameter(_local_6, "days", _SafeStr_4360.daysUntilNextGift.toString());
                }
                else
                {
                    if (_SafeStr_4360.hasClub)
                    {
                        _local_6 = "catalog.club_gift.not_available";
                    }
                    else
                    {
                        _local_6 = "catalog.club_gift.no_club";
                    };
                };
            };
            _local_7.caption = _SafeStr_4360.localization.getLocalization(_local_6);
            if (!_SafeStr_4360.purse)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = window.findChildByName("past_club_days");
            if (_local_2)
            {
                _local_5 = (_SafeStr_4360.purse.pastClubDays + _SafeStr_4360.purse.pastVipDays);
                _local_6 = ((_local_5 >= 31) ? "catalog.club_gift.past_club.long" : "catalog.club_gift.past_club");
                _local_4 = (_local_5 % 31);
                _local_1 = int((_local_5 / 31));
                _SafeStr_4360.localization.registerParameter(_local_6, "days", _local_4.toString());
                _SafeStr_4360.localization.registerParameter(_local_6, "months", _local_1.toString());
                _local_2.caption = _SafeStr_4360.localization.getLocalization(_local_6);
            };
            var _local_3:_SafeStr_3109 = window.findChildByName("past_vip_days");
            if (_local_3)
            {
                _local_6 = ((_SafeStr_4360.purse.pastVipDays >= 31) ? "catalog.club_gift.past_vip.long" : "catalog.club_gift.past_vip");
                _local_4 = (_SafeStr_4360.purse.pastVipDays % 31);
                _local_1 = int((_SafeStr_4360.purse.pastVipDays / 31));
                _SafeStr_4360.localization.registerParameter(_local_6, "days", _local_4.toString());
                _SafeStr_4360.localization.registerParameter(_local_6, "months", _local_1.toString());
                _local_3.caption = _SafeStr_4360.localization.getLocalization(_local_6);
            };
        }

        private function updateList():void
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_11:*;
            var _local_12:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            if ((((!(_SafeStr_4360)) || (!(window))) || (!(page))))
            {
                return;
            };
            for each (_local_1 in _offers)
            {
                _local_1.dispose();
            };
            _offers.reset();
            var _local_2:Array = _SafeStr_4360.getOffers();
            if (!_local_2)
            {
                return;
            };
            var _local_4:_SafeStr_24 = _SafeStr_4360.getGiftData();
            if (!_local_4)
            {
                return;
            };
            var _local_10:IItemListWindow = (window.findChildByName("gift_list") as IItemListWindow);
            if (!_local_10)
            {
                return;
            };
            _local_10.destroyListItems();
            for each (var _local_7:_SafeStr_1406 in _local_2)
            {
                _local_11 = new Vector.<_SafeStr_3151>(0);
                _local_12 = _SafeStr_4360.catalog.getProductData(_local_7.localizationId);
                for each (var _local_8:_SafeStr_1611 in _local_7.products)
                {
                    _local_9 = _SafeStr_4360.catalog.getFurnitureData(_local_8.furniClassId, _local_8.productType);
                    _local_5 = new Product(_local_8.productType, _local_8.furniClassId, _local_8.extraParam, _local_8.productCount, _local_12, _local_9, _catalog);
                    _local_11.push(_local_5);
                };
                _local_1 = new Offer(_local_7.offerId, _local_7.localizationId, _local_7.isRent, _local_7.priceInCredits, _local_7.priceInActivityPoints, _local_7.activityPointType, _local_7.giftable, _local_7.clubLevel, _local_11, _local_7.bundlePurchaseAllowed, _catalog);
                _local_1.page = page;
                _local_6 = (_local_4.getValue(_local_1.offerId) as _SafeStr_1537);
                _local_3 = createListItem(_local_1, _local_6);
                if (_local_3)
                {
                    _local_10.addListItem(_local_3);
                    _offers.add(_local_1.offerId, _local_1);
                };
            };
        }

        private function createListItem(_arg_1:_SafeStr_3141, _arg_2:_SafeStr_1537):_SafeStr_3109
        {
            var _local_9:int;
            var _local_13:* = null;
            var _local_8:int;
            var _local_12:int;
            if ((((!(_arg_1)) || (!(_arg_1.product))) || (!(_arg_2))))
            {
                return (null);
            };
            var _local_3:_SafeStr_3133 = (createWindow("club_gift_list_item") as _SafeStr_3133);
            if (!_local_3)
            {
                return (null);
            };
            _local_3.procedure = clickHandler;
            var _local_4:_SafeStr_3151 = _arg_1.product;
            if (!_local_4)
            {
                return (null);
            };
            var _local_6:_SafeStr_3182 = _local_4.productData;
            if (!_local_6)
            {
                return (null);
            };
            setText(_local_3.findChildByName("gift_name"), _local_6.name);
            setText(_local_3.findChildByName("gift_desc"), _local_6.description);
            if (_arg_2.isVip)
            {
                _local_9 = (_arg_2.daysRequired - _SafeStr_4360.purse.pastVipDays);
            }
            else
            {
                _local_9 = (_arg_2.daysRequired - (_SafeStr_4360.purse.pastClubDays + _SafeStr_4360.purse.pastVipDays));
            };
            if (((!(_arg_2.isSelectable)) && (_local_9 > 0)))
            {
                if (_arg_2.isVip)
                {
                    _local_13 = "catalog.club_gift.vip_missing";
                }
                else
                {
                    _local_13 = "catalog.club_gift.club_missing";
                };
                if (_local_9 >= 31)
                {
                    _local_13 = (_local_13 + ".long");
                };
                _local_8 = (_local_9 % 31);
                _local_12 = int((_local_9 / 31));
                _SafeStr_4360.localization.registerParameter(_local_13, "days", _local_8.toString());
                _SafeStr_4360.localization.registerParameter(_local_13, "months", _local_12.toString());
            }
            else
            {
                if (_SafeStr_4360.giftsAvailable > 0)
                {
                    _local_13 = "catalog.club_gift.selectable";
                }
                else
                {
                    _local_13 = "";
                };
            };
            setText(_local_3.findChildByName("months_required"), ((_local_13.length > 0) ? _SafeStr_4360.localization.getLocalization(_local_13) : ""));
            var _local_10:IIconWindow = (_local_3.findChildByName("vip_icon") as IIconWindow);
            if (_local_10)
            {
                _local_10.visible = _arg_2.isVip;
            };
            var _local_11:_SafeStr_3122 = (_local_3.findChildByName("select_button") as _SafeStr_3122);
            if (_local_11)
            {
                if (((_arg_2.isSelectable) && (_SafeStr_4360.giftsAvailable > 0)))
                {
                    _local_11.enable();
                }
                else
                {
                    _local_11.disable();
                };
                _local_11.id = _arg_1.offerId;
            };
            var _local_7:_SafeStr_3300 = _arg_1.productContainer;
            if (!_local_7)
            {
                return (null);
            };
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.roomEngine))))
            {
                return (null);
            };
            var _local_5:_SafeStr_3133 = (_local_3.findChildByName("image_container") as _SafeStr_3133);
            if (_local_5)
            {
                _local_7.view = _local_5;
                _local_7.initProductIcon(page.viewer.roomEngine);
                _local_5.procedure = mouseOverHandler;
                _local_5.id = _arg_1.offerId;
            };
            return (_local_3);
        }

        private function setText(_arg_1:_SafeStr_3109, _arg_2:String):void
        {
            _arg_1.caption = _arg_2;
        }

        private function clickHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((((!(_arg_1)) || (!(_arg_2))) || (!(_offers))) || (!(_SafeStr_4360))))
            {
                return;
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_arg_2.name != "select_button")
            {
                return;
            };
            var _local_3:_SafeStr_3141 = _offers.getValue(_arg_2.id);
            if (!_local_3)
            {
                return;
            };
            _SafeStr_4360.selectGift(_local_3);
        }

        private function mouseOverHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            if ((((!(_arg_1)) || (!(_arg_2))) || (!(_offers))))
            {
                return;
            };
            if (_arg_2.name != "image_container")
            {
                return;
            };
            var _local_3:_SafeStr_3141 = _offers.getValue(_arg_2.id);
            if (!_local_3)
            {
                return;
            };
            if (_arg_1.type == "WME_OVER")
            {
                _local_4 = new Rectangle();
                _arg_2.getGlobalRectangle(_local_4);
            };
            if (_arg_1.type == "WME_OUT")
            {
                hidePreview();
            };
        }

        private function showPreview(_arg_1:Offer, _arg_2:Rectangle):void
        {
            var _local_6:* = null;
            if (((!(_arg_1)) || (!(_arg_1.productContainer))))
            {
                return;
            };
            if ((((!(page)) || (!(page.viewer))) || (!(page.viewer.roomEngine))))
            {
                return;
            };
            var _local_4:_SafeStr_3151 = _arg_1.product;
            if (!_local_4)
            {
                return;
            };
            if (!_preview)
            {
                _preview = (createWindow("club_gift_preview") as _SafeStr_3133);
            };
            if (!_preview)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_preview.findChildByName("image") as _SafeStr_3264);
            if (!_local_3)
            {
                return;
            };
            switch (_local_4.productType)
            {
                case "s":
                    _local_6 = page.viewer.roomEngine.getFurnitureImage(_local_4.productClassId, new Vector3d(90), 64, null, 0, _local_4.extraParam);
                    break;
                case "i":
                    _local_6 = page.viewer.roomEngine.getWallItemImage(_local_4.productClassId, new Vector3d(90), 64, null, 0, _local_4.extraParam);
                    break;
                default:
                    return;
            };
            if (((!(_local_6)) || (!(_local_6.data))))
            {
                return;
            };
            _local_3.width = _local_6.data.width;
            _local_3.height = _local_6.data.height;
            if (_local_3.bitmap)
            {
                _local_3.bitmap.dispose();
            };
            _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height);
            _local_3.bitmap.draw(_local_6.data);
            _local_6.data.dispose();
            var _local_5:Point = Point.interpolate(_arg_2.topLeft, _arg_2.bottomRight, 0.5);
            _preview.setGlobalPosition(_local_5.subtract(new Point((_preview.width / 2), (_preview.height / 2))));
            _preview.visible = true;
            _preview.activate();
        }

        private function hidePreview():void
        {
            if (_preview)
            {
                _preview.visible = false;
            };
        }

        private function createWindow(_arg_1:String):_SafeStr_3109
        {
            if ((((!(_SafeStr_4360)) || (!(_SafeStr_4360.assets))) || (!(_SafeStr_4360.windowManager))))
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
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_1406 = "_-227" (String#24167, DoABC#4)
// _SafeStr_1537 = "_-a1D" (String#27642, DoABC#4)
// _SafeStr_1611 = "_-m6" (String#8890, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


