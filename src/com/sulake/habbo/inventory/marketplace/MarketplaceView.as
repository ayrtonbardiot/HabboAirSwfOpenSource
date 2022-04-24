// by nota

//com.sulake.habbo.inventory.marketplace.MarketplaceView

package com.sulake.habbo.inventory.marketplace
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
    import com.sulake.habbo.window.widgets.IRarityItemGridOverlayWidget;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class MarketplaceView implements _SafeStr_3140 
    {

        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3745:IAssetLibrary;
        private var _SafeStr_3882:_SafeStr_3263;
        private var _SafeStr_4619:MarketplaceModel;
        private var _roomEngine:IRoomEngine;
        private var _localization:_SafeStr_18;
        private var _disposed:Boolean = false;
        private var _SafeStr_5454:int;
        private var _SafeStr_5452:int;
        private var _furniName:String;
        private var _SafeStr_5453:HabboInventory;

        public function MarketplaceView(_arg_1:MarketplaceModel, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary, _arg_4:IRoomEngine, _arg_5:_SafeStr_18, _arg_6:HabboInventory)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_3745 = _arg_3;
            _windowManager = _arg_2;
            _roomEngine = _arg_4;
            _localization = _arg_5;
            _SafeStr_5453 = _arg_6;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4619 = null;
                _SafeStr_3745 = null;
                _windowManager = null;
                _roomEngine = null;
                _localization = null;
                disposeView();
                _disposed = true;
            };
        }

        private function disposeView():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function showBuyTokens(_arg_1:int, _arg_2:int):void
        {
            if (_localization)
            {
                _localization.registerParameter("inventory.marketplace.buy_tokens.info", "price", _arg_1.toString());
                _localization.registerParameter("inventory.marketplace.buy_tokens.info", "count", _arg_2.toString());
                _localization.registerParameter("inventory.marketplace.buy_tokens.info", "free", (_arg_2 - 1).toString());
                _localization.registerParameter("inventory.marketplace.buy_tokens.buy", "price", _arg_1.toString());
            };
            _SafeStr_3882 = (createWindow("buy_marketplace_tokens_xml") as _SafeStr_3263);
            if (_SafeStr_3882 == null)
            {
                return;
            };
            _SafeStr_3882.procedure = clickHandler;
            _SafeStr_3882.center();
        }

        public function showMakeOffer(_arg_1:FurnitureItem):void
        {
            var _local_8:* = null;
            var _local_11:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_10:* = null;
            var _local_9:* = null;
            if (((((!(_arg_1)) || (!(_localization))) || (!(_roomEngine))) || (!(_SafeStr_4619))))
            {
                return;
            };
            _SafeStr_3882 = (createWindow("make_marketplace_offer_xml") as _SafeStr_3263);
            if (!_SafeStr_3882)
            {
                return;
            };
            var _local_2:ITextFieldWindow = (_SafeStr_3882.findChildByName("price_input") as ITextFieldWindow);
            if (_local_2 != null)
            {
                _local_2.restrict = "0-9";
            };
            checkPrice();
            _localization.registerParameter("inventory.marketplace.make_offer.expiration_info", "time", _SafeStr_4619.expirationHours.toString());
            _localization.registerParameter("inventory.marketplace.make_offer.min_price", "minprice", _SafeStr_4619.offerMinPrice.toString());
            _localization.registerParameter("inventory.marketplace.make_offer.max_price", "maxprice", _SafeStr_4619.offerMaxPrice.toString());
            var _local_6:* = 4293848814;
            if (!_arg_1.isWallItem)
            {
                _local_8 = _roomEngine.getFurnitureImage(_arg_1.type, new Vector3d(90, 0, 0), 64, this, _local_6, _arg_1.extra);
            }
            else
            {
                _local_8 = _roomEngine.getWallItemImage(_arg_1.type, new Vector3d(90, 0, 0), 64, this, _local_6, _arg_1.stuffData.getLegacyString());
            };
            if (!_local_8)
            {
                return;
            };
            _SafeStr_5454 = _local_8.id;
            setFurniImage(_local_8.data);
            if (_arg_1.isWallItem)
            {
                _local_11 = ("wallItem.name." + _arg_1.type);
                _local_5 = ("wallItem.desc." + _arg_1.type);
            }
            else
            {
                _local_11 = ("roomItem.name." + _arg_1.type);
                _local_5 = ("roomItem.desc." + _arg_1.type);
            };
            if (_arg_1.category == 6)
            {
                _local_11 = (("poster_" + _arg_1.stuffData.getLegacyString()) + "_name");
                _local_5 = (("poster_" + _arg_1.stuffData.getLegacyString()) + "_desc");
            };
            _furniName = _localization.getLocalization(_local_11);
            setText("furni_name", (("${" + _local_11) + "}"));
            setText("furni_desc", (("${" + _local_5) + "}"));
            _SafeStr_3882.procedure = clickHandler;
            _SafeStr_3882.center();
            var _local_3:ITextWindow = (_SafeStr_3882.findChildByName("average_price") as ITextWindow);
            if (_local_3)
            {
                _local_3.visible = false;
            };
            if (((!(_arg_1.stuffData == null)) && (_arg_1.stuffData.uniqueSerialNumber > 0)))
            {
                _local_7 = _SafeStr_3199(_SafeStr_3882.findChildByName("unique_item_overlay_widget"));
                _local_7.visible = true;
                _local_4 = ILimitedItemPreviewOverlayWidget(_local_7.widget);
                _local_4.serialNumber = _arg_1.stuffData.uniqueSerialNumber;
                _local_4.seriesSize = _arg_1.stuffData.uniqueSeriesSize;
            };
            if (((!(_arg_1.stuffData == null)) && (_arg_1.stuffData.rarityLevel >= 0)))
            {
                _local_10 = _SafeStr_3199(_SafeStr_3882.findChildByName("rarity_item_overlay_widget"));
                _local_10.visible = true;
                _local_9 = IRarityItemGridOverlayWidget(_local_10.widget);
                _local_9.rarityLevel = _arg_1.stuffData.rarityLevel;
            };
            _SafeStr_4619.getItemStats();
        }

        private function setFurniImage(_arg_1:BitmapData):void
        {
            if (((_arg_1 == null) || (_SafeStr_3882 == null)))
            {
                return;
            };
            var _local_5:_SafeStr_3264 = (_SafeStr_3882.findChildByName("furni_image") as _SafeStr_3264);
            if (_local_5 == null)
            {
                return;
            };
            var _local_2:BitmapData = new BitmapData(_local_5.width, _local_5.height, true, 0);
            var _local_3:int = ((_local_2.width - _arg_1.width) * 0.5);
            var _local_4:int = ((_local_2.height - _arg_1.height) * 0.5);
            _local_2.draw(_arg_1, new Matrix(1, 0, 0, 1, _local_3, _local_4));
            _local_5.bitmap = _local_2;
        }

        private function setText(_arg_1:String, _arg_2:String):void
        {
            if (_SafeStr_3882 == null)
            {
                return;
            };
            var _local_3:ITextWindow = (_SafeStr_3882.findChildByName(_arg_1) as ITextWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.text = _arg_2;
        }

        public function showNoCredits(_arg_1:int):void
        {
            if (_localization)
            {
                _localization.registerParameter("inventory.marketplace.no_credits.info", "price", _arg_1.toString());
            };
            _SafeStr_3882 = (createWindow("marketplace_no_credits_xml") as _SafeStr_3263);
            if (_SafeStr_3882 == null)
            {
                return;
            };
            _SafeStr_3882.procedure = clickHandler;
            _SafeStr_3882.center();
        }

        private function showConfirmation():void
        {
            _localization.registerParameter("inventory.marketplace.confirm_offer.info", "furniname", _furniName);
            _localization.registerParameter("inventory.marketplace.confirm_offer.info", "price", calculateFinalPrice(_SafeStr_5452).toString());
            var _local_2:String = "${inventory.marketplace.confirm_offer.title}";
            var _local_1:String = "${inventory.marketplace.confirm_offer.info}";
            _windowManager.confirm(_local_2, _local_1, 0, confirmationCallback);
        }

        private function confirmationCallback(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return;
            };
            _arg_1.dispose();
            if (_SafeStr_4619 == null)
            {
                return;
            };
            if (_arg_2.type == "WE_OK")
            {
                _SafeStr_4619.makeOffer(_SafeStr_5452);
            };
            _SafeStr_4619.releaseItem();
        }

        private function createWindow(_arg_1:String):_SafeStr_3109
        {
            if (((_SafeStr_3745 == null) || (_windowManager == null)))
            {
                return (null);
            };
            var _local_2:XmlAsset = (_SafeStr_3745.getAssetByName(_arg_1) as XmlAsset);
            if (_local_2 == null)
            {
                return (null);
            };
            return (_windowManager.buildFromXML((_local_2.content as XML)));
        }

        private function clickHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "buy_tokens_button":
                        _SafeStr_4619.buyMarketplaceTokens();
                        disposeView();
                        break;
                    case "cancel_buy_tokens_button":
                    case "cancel_make_offer_button":
                    case "cancel_no_credits_button":
                    case "header_button_close":
                        _SafeStr_4619.releaseItem();
                        disposeView();
                        break;
                    case "make_offer_button":
                        _local_3 = (_SafeStr_3882.findChildByName("price_input") as ITextFieldWindow);
                        if (_local_3 != null)
                        {
                            _SafeStr_5452 = parseInt(_local_3.text);
                            showConfirmation();
                        };
                        disposeView();
                        break;
                    case "get_credits_button":
                        _SafeStr_4619.releaseItem();
                        openCreditsPage();
                        disposeView();
                };
            };
            if (_arg_1.type == "WE_CHANGE")
            {
                if (_arg_2.name == "price_input")
                {
                    checkPrice();
                };
            };
        }

        private function openCreditsPage():void
        {
            HabboWebTools.openWebPageAndMinimizeClient(_SafeStr_5453.getProperty("web.shop.relativeUrl"));
        }

        private function calculateFinalPrice(_arg_1:int):int
        {
            var _local_2:int = int(Math.ceil((Math.round((1000 * (_arg_1 * ((_SafeStr_4619.sellingFeePercentage / 100) + ((0.5 * _arg_1) / _SafeStr_4619.halfTaxLimit))))) / 1000)));
            return (_arg_1 - _local_2);
        }

        private function checkPrice():void
        {
            if (_SafeStr_3882 == null)
            {
                return;
            };
            var _local_2:ITextFieldWindow = (_SafeStr_3882.findChildByName("price_input") as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:int = parseInt(_local_2.text);
            if (_local_3 > _SafeStr_4619.offerMaxPrice)
            {
                _local_2.text = _SafeStr_4619.offerMaxPrice.toString();
                _local_3 = _SafeStr_4619.offerMaxPrice;
            };
            var _local_4:int = calculateFinalPrice(_local_3);
            var _local_1:_SafeStr_3122 = (_SafeStr_3882.findChildByName("make_offer_button") as _SafeStr_3122);
            var _local_5:ITextWindow = (_SafeStr_3882.findChildByName("final_price") as ITextWindow);
            if (((_local_1 == null) || (_local_5 == null)))
            {
                return;
            };
            if (_local_3 < _SafeStr_4619.offerMinPrice)
            {
                _localization.registerParameter("shop.marketplace.invalid.price", "minPrice", _SafeStr_4619.offerMinPrice.toString());
                _localization.registerParameter("shop.marketplace.invalid.price", "maxPrice", _SafeStr_4619.offerMaxPrice.toString());
                _local_5.text = "${shop.marketplace.invalid.price}";
                _local_1.disable();
            }
            else
            {
                _local_5.text = ((_localization.getLocalization("sell.in.marketplace.revenue.label") + ": ") + _local_4);
                _local_1.enable();
            };
        }

        public function showResult(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_arg_1 == 1)
            {
                _local_2 = "${inventory.marketplace.result.title.success}";
            }
            else
            {
                _local_2 = "${inventory.marketplace.result.title.failure}";
            };
            var _local_3:String = (("${inventory.marketplace.result." + _arg_1) + "}");
            _windowManager.alert(_local_2, _local_3, 0, closeAlert);
        }

        private function closeAlert(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4619.releaseItem();
            _arg_1.dispose();
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (_SafeStr_5454 == _arg_1)
            {
                setFurniImage(_arg_2);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function showAlert(_arg_1:String, _arg_2:String):void
        {
            _windowManager.alert(_arg_1, _arg_2, 0, closeAlert);
        }

        public function updateAveragePrice(_arg_1:int, _arg_2:int):void
        {
            if ((((!(_SafeStr_3882)) || (!(_localization))) || (!(_SafeStr_4619))))
            {
                return;
            };
            var _local_3:ITextWindow = (_SafeStr_3882.findChildByName("average_price") as ITextWindow);
            if (!_local_3)
            {
                return;
            };
            var _local_6:int = int(Math.floor((_arg_1 / (1 + (_SafeStr_4619.commission * 0.01)))));
            _localization.registerParameter("inventory.marketplace.make_offer.average_price", "days", _arg_2.toString());
            var _local_4:String = ((_arg_1 == 0) ? " - " : _arg_1.toString());
            _localization.registerParameter("inventory.marketplace.make_offer.average_price", "price", _local_4);
            var _local_5:String = ((_local_6 == 0) ? " - " : _local_6.toString());
            _localization.registerParameter("inventory.marketplace.make_offer.average_price", "price_no_commission", _local_5);
            _local_3.visible = true;
        }


    }
}//package com.sulake.habbo.inventory.marketplace

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5452 = "_-g1B" (String#14147, DoABC#4)
// _SafeStr_5453 = "_-J1o" (String#22217, DoABC#4)
// _SafeStr_5454 = "_-Fg" (String#22554, DoABC#4)


