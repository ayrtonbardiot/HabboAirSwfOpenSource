﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog

package com.sulake.habbo.catalog.purchase
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.catalog.viewer.Offer;
    import com.sulake.habbo.catalog.HabboCatalogUtils;
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;
    import com.sulake.habbo.catalog.viewer.GameTokensOffer;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Matrix;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.catalog.viewer.widgets.utils.RentUtils;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.room._SafeStr_3248;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.habbo.window.utils._SafeStr_3114;

    public class PurchaseConfirmationDialog implements _SafeStr_1875, _SafeStr_3140 
    {

        private const MAX_SUGGESTIONS:int = 10;
        private const COLOR_EVEN:uint = 4293848814;
        private const COLOR_ODD:uint = 0xFFFFFFFF;
        private const COLOR_HIGHLIGHT:uint = 4291613146;

        private var _catalog:HabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _localization:_SafeStr_18;
        private var _assets:_SafeStr_21;
        private var _offerId:int;
        private var _SafeStr_4890:String = "";
        private var _SafeStr_4786:int;
        private var _SafeStr_4711:String;
        private var _SafeStr_4601:IStuffData = null;
        private var _SafeStr_4782:Array;
        private var _userName:String;
        private var _SafeStr_4900:_SafeStr_3133;
        private var _SafeStr_4889:_SafeStr_3133;
        private var _highlightIndex:int = -1;
        private var _SafeStr_4892:int;
        private var _SafeStr_8323:Boolean = false;
        private var _receiverName:String = "";
        private var _SafeStr_4891:int;
        private var _SafeStr_4896:int = 0;
        private var _SafeStr_4897:Array = [];
        private var _SafeStr_4898:Array = [];
        private var _SafeStr_4893:Array = [];
        private var _SafeStr_4895:int;
        private var _SafeStr_4894:int;
        private var _SafeStr_4899:int;
        private var _window:_SafeStr_3263;
        private var _disposed:Boolean = false;

        public function PurchaseConfirmationDialog(_arg_1:_SafeStr_18, _arg_2:_SafeStr_21)
        {
            _localization = _arg_1;
            _assets = _arg_2;
        }

        private static function isValentinesBox(_arg_1:int):Boolean
        {
            return (_arg_1 == 8);
        }


        public function showOffer(_arg_1:IHabboCatalog, _arg_2:IRoomEngine, _arg_3:_SafeStr_3141, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:IStuffData, _arg_8:Array, _arg_9:String, _arg_10:BitmapData):void
        {
            _catalog = (_arg_1 as HabboCatalog);
            _roomEngine = _arg_2;
            _offerId = _arg_3.offerId;
            _SafeStr_4786 = _arg_4;
            _SafeStr_4711 = _arg_5;
            _SafeStr_4601 = _arg_7;
            _SafeStr_4782 = _arg_8;
            _userName = _arg_9;
            _SafeStr_4892 = _arg_6;
            _SafeStr_8323 = ((_catalog.bundleDiscountEnabled) ? _arg_3.bundlePurchaseAllowed : false);
            if (((_arg_3 is Offer) && (!(_arg_3.product == null))))
            {
                _SafeStr_4890 = _arg_3.product.productType;
            }
            else
            {
                if (((_arg_3 is ClubBuyOfferData) || (HabboCatalogUtils.buildersClub(_arg_3.localizationId))))
                {
                    _SafeStr_4890 = "h";
                }
                else
                {
                    if ((_arg_3 is GameTokensOffer))
                    {
                        _SafeStr_4890 = "GAME_TOKEN";
                    }
                    else
                    {
                        return;
                    };
                };
            };
            showConfirmationDialog(_arg_3, _arg_10);
            _catalog.syncPlacedOfferWithPurchase(_arg_3);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _disposed = true;
            _catalog = null;
            _roomEngine = null;
            _offerId = -1;
            _SafeStr_4786 = -1;
            _SafeStr_4711 = "";
            _SafeStr_4782 = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4900 = null;
            if (_SafeStr_4889 != null)
            {
                _SafeStr_4889.dispose();
                _SafeStr_4889 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get productType():String
        {
            return (_SafeStr_4890);
        }

        public function getIconWrapper():_SafeStr_3264
        {
            return ((_window) ? (_window.findChildByName("product_image") as _SafeStr_3264) : null);
        }

        public function isGiftPurchase():Boolean
        {
            return ((!(_receiverName == null)) && (!(_receiverName == "")));
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (_arg_1 == _SafeStr_4891)
            {
                _SafeStr_4891 = 0;
                setImage(_arg_2, true);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function setImage(_arg_1:BitmapData, _arg_2:Boolean):void
        {
            if ((((_window == null) || (_arg_1 == null)) || (disposed)))
            {
                return;
            };
            var _local_5:_SafeStr_3264 = (_window.findChildByName("product_image") as _SafeStr_3264);
            if (_local_5 == null)
            {
                return;
            };
            if (_local_5.bitmap != null)
            {
                _local_5.bitmap.dispose();
                _local_5.bitmap = null;
            };
            if (_local_5.bitmap == null)
            {
                _local_5.bitmap = new BitmapData(_local_5.width, _local_5.height, true, 0);
            };
            var _local_3:int = ((_local_5.width - _arg_1.width) * 0.5);
            var _local_4:int = ((_local_5.height - _arg_1.height) * 0.5);
            _local_5.bitmap.draw(_arg_1, new Matrix(1, 0, 0, 1, _local_3, _local_4));
            if (_arg_2)
            {
                _arg_1.dispose();
            };
        }

        private function showConfirmationDialog(_arg_1:_SafeStr_3141, _arg_2:BitmapData):void
        {
            var _local_17:* = null;
            var _local_18:* = null;
            var _local_8:int;
            var _local_10:Boolean;
            var _local_14:* = null;
            var _local_19:* = null;
            var _local_16:* = null;
            var _local_6:* = null;
            var _local_12:* = null;
            var _local_5:int;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_11:* = null;
            if (_catalog == null)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
            };
            _window = (_catalog.utils.createWindow("purchase_confirmation", 2) as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            updateLocalizations(_arg_1);
            var _local_15:_SafeStr_3133 = (_window.findChildByName("purchase_cost_box") as _SafeStr_3133);
            _catalog.utils.showPriceInContainer(_local_15, _arg_1, _SafeStr_4892);
            addClickListener("buy_button", onBuyButtonClick);
            addClickListener("cancel_button", onClose);
            addClickListener("header_button_close", onClose);
            _window.center();
            if (_catalog.getBoolean("disclaimer.credit_spending.enabled"))
            {
                _window.findChildByName("spending_disclaimer").addEventListener("WME_CLICK", onSpendingDisclaimerClicked);
                _window.findChildByName("spending_disclaimer").addEventListener("WME_DOUBLE_CLICK", onSpendingDisclaimerClicked);
                setDisclaimerAccepted(false);
            }
            else
            {
                _window.findChildByName("disclaimer").dispose();
                setDisclaimerAccepted(true);
            };
            var _local_13:ITextWindow = (_window.findChildByName("product_name") as ITextWindow);
            if (_local_13 != null)
            {
                _local_17 = _catalog.getProductData(_arg_1.localizationId);
                _local_13.text = ((_local_17 == null) ? _arg_1.localizationId : _local_17.name);
            };
            var _local_4:ITextWindow = (_window.findChildByName("quantity") as ITextWindow);
            if (_local_4 != null)
            {
                if (((_catalog.multiplePurchaseEnabled) && (_SafeStr_4892 > 1)))
                {
                    _local_4.text = ("X " + _SafeStr_4892);
                }
                else
                {
                    _local_18 = IItemListWindow(_window.findChildByName("properties_itemlist"));
                    if (_local_18 != null)
                    {
                        _local_18.removeListItem(_local_4);
                    };
                };
            };
            _window.findChildByName("freeQuantity").visible = false;
            if (_catalog.bundleDiscountEnabled)
            {
                _local_8 = _catalog.utils.getDiscountItemsCount(_SafeStr_4892);
                _window.findChildByName("freeQuantity").visible = (_local_8 > 0);
                _catalog.localization.registerParameter("shop.bonus.items.count", "amount", _local_8.toString());
            };
            var _local_9:_SafeStr_3264 = (_window.findChildByName("product_image") as _SafeStr_3264);
            if (_local_9 != null)
            {
                _local_10 = false;
                if (ProductImageConfiguration.hasProductImage(_arg_1.localizationId))
                {
                    _local_14 = ProductImageConfiguration.PRODUCT_IMAGES[_arg_1.localizationId];
                    _local_19 = (_assets.getAssetByName(_local_14) as BitmapDataAsset);
                    if (_local_19)
                    {
                        setImage((_local_19.content as BitmapData), false);
                        _local_10 = true;
                    };
                };
                if (((!(_local_10)) && (_arg_1.product)))
                {
                    _local_16 = _catalog.roomEngine;
                    _local_5 = 0;
                    _local_7 = "";
                    if ((_arg_1 is Offer))
                    {
                        _local_3 = _arg_1.product;
                        if (_local_3 != null)
                        {
                            _local_5 = _local_3.productClassId;
                            _local_7 = _local_3.extraParam;
                        };
                    };
                    if (_arg_2 == null)
                    {
                        switch (productType)
                        {
                            case "s":
                                _local_6 = _local_16.getFurnitureImage(_local_5, new Vector3d(90, 0, 0), 64, this, 0, _local_7, -1, -1, _SafeStr_4601);
                                break;
                            case "i":
                                _local_6 = _local_16.getWallItemImage(_local_5, new Vector3d(90, 0, 0), 64, this, 0, _local_7);
                                break;
                            case "e":
                                _local_12 = _catalog.getPixelEffectIcon(_local_5);
                                break;
                            case "h":
                                _local_12 = _catalog.getSubscriptionProductIcon(_local_5);
                                break;
                            case "r":
                                _local_11 = _catalog.avatarRenderManager.createAvatarImage(_local_7, "h", null, this);
                                _local_11.setDirection("full", 3);
                                _local_11.appendAction("wave");
                                _local_11.appendAction("gest", "sml");
                                _local_12 = _local_11.getImage("full", true);
                                _local_11.dispose();
                        };
                        if (_local_6 != null)
                        {
                            _local_12 = _local_6.data;
                            _SafeStr_4891 = _local_6.id;
                        };
                    }
                    else
                    {
                        _local_12 = _arg_2;
                    };
                    setImage(_local_12, true);
                    RentUtils.updateBuyCaption(_arg_1, (_window.findChildByName("buy_button") as _SafeStr_3122));
                };
            };
        }

        private function onSpendingDisclaimerClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3158 = (_arg_1.target as _SafeStr_3158);
            if (_local_2 != null)
            {
                setDisclaimerAccepted(_local_2.isSelected);
            };
        }

        private function setDisclaimerAccepted(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("buy_button");
            if (_local_2 == null)
            {
                return;
            };
            if (_arg_1)
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            };
        }

        private function updateLocalizations(_arg_1:_SafeStr_3141):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3182 = _catalog.getProductData(_arg_1.localizationId);
            var _local_3:String = ((_local_2 == null) ? "" : _local_2.name);
            _catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs", "offer_name", _local_3);
        }

        private function addClickListener(_arg_1:String, _arg_2:Function):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", _arg_2);
            };
        }

        public function getAvatarFaceBitmap(_arg_1:String):BitmapData
        {
            if (((_catalog == null) || (_catalog.avatarRenderManager == null)))
            {
                return (null);
            };
            var _local_2:BitmapData;
            var _local_3:_SafeStr_3138 = _catalog.avatarRenderManager.createAvatarImage(_arg_1, "h", null, this);
            if (_local_3 != null)
            {
                _local_2 = _local_3.getCroppedImage("head");
                _local_3.dispose();
            };
            return (_local_2);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (((((_catalog == null) || (_window == null)) || (_window.disposed)) || (disposed)))
            {
                return;
            };
            if (_arg_1 == _catalog.sessionDataManager.figure)
            {
                updateGiftDialogAvatarImage();
            };
            var _local_2:_SafeStr_3138 = _catalog.avatarRenderManager.createAvatarImage(_arg_1, "h", null, this);
            _local_2.setDirection("full", 3);
            _local_2.appendAction("wave");
            _local_2.appendAction("gest", "sml");
            var _local_3:BitmapData = _local_2.getImage("full", true);
            _local_2.dispose();
            setImage(_local_3, true);
        }

        private function enableGiftDialogAvatarImage(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3264 = (_window.findChildByName("avatar_image") as _SafeStr_3264);
            if (_local_2 != null)
            {
                if (_arg_1)
                {
                    updateGiftDialogAvatarImage();
                }
                else
                {
                    updateUnknownSenderAvatarImage();
                };
            };
            var _local_3:ITextWindow = (_window.findChildByName("message_from") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_1;
            };
        }

        private function updateGiftDialogAvatarImage():void
        {
            var _local_1:BitmapData = getAvatarFaceBitmap(_catalog.sessionDataManager.figure);
            if (_local_1 != null)
            {
                updateAvatarImage(_local_1);
            };
        }

        private function updateUnknownSenderAvatarImage():void
        {
            var _local_1:* = null;
            var _local_2:BitmapDataAsset = (_assets.getAssetByName("gift_incognito") as BitmapDataAsset);
            if (_local_2 != null)
            {
                _local_1 = (_local_2.content as BitmapData);
                if (_local_1 != null)
                {
                    updateAvatarImage(_local_1.clone());
                };
            };
        }

        private function updateAvatarImage(_arg_1:BitmapData):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("avatar_image") as _SafeStr_3264);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.bitmap = _arg_1;
            _local_2.width = _arg_1.width;
            _local_2.height = _arg_1.height;
        }

        private function onShowFaceSelected(_arg_1:_SafeStr_3116):void
        {
            enableGiftDialogAvatarImage(true);
            updateGiftDialogAvatarImage();
        }

        private function onShowFaceUnselected(_arg_1:_SafeStr_3116):void
        {
            enableGiftDialogAvatarImage(false);
        }

        private function isShowPurchaserName():Boolean
        {
            var _local_1:* = null;
            if (isModerator())
            {
                if (_window != null)
                {
                    _local_1 = (_window.findChildByName("show_face_checkbox") as _SafeStr_3158);
                    if (_local_1 != null)
                    {
                        return (_local_1.isSelected);
                    };
                };
                return (false);
            };
            return (true);
        }

        private function updateGiftDialogLabels():void
        {
            var _local_9:* = null;
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            var _local_3:Boolean = isDefaultBoxSelected();
            var _local_6:String = "";
            var _local_7:String = "";
            var _local_1:ILocalization;
            var _local_2:ITextWindow = (_window.findChildByName("pick_box_title") as ITextWindow);
            if (_local_2 != null)
            {
                _local_7 = ((_local_3) ? "catalog.gift_wrapping_new.box.default" : ("catalog.gift_wrapping_new.box." + _SafeStr_4893[_SafeStr_4894]));
                _local_1 = _localization.getLocalizationRaw(_local_7);
                _local_6 = _local_7;
                if (_local_1 != null)
                {
                    _local_6 = _local_1.value;
                };
                _local_2.text = _local_6;
            };
            var _local_5:ITextWindow = (_window.findChildByName("pick_box_price_title") as ITextWindow);
            if (_local_5 != null)
            {
                _local_7 = ((_local_3) ? "catalog.gift_wrapping_new.freeprice" : "catalog.gift_wrapping_new.price");
                _local_1 = _localization.getLocalizationRaw(_local_7);
                _local_6 = _local_7;
                if (_local_1 != null)
                {
                    _local_6 = _local_1.value;
                };
                _local_5.text = _local_6;
            };
            var _local_8:IItemListWindow = (_window.findChildByName("price_box_container") as IItemListWindow);
            if (_local_8 != null)
            {
                _local_9 = _local_8.getListItemByName("small_coin");
                if (_local_9 != null)
                {
                    _local_9.visible = (!(_local_3));
                    _local_8.arrangeListItems();
                };
            };
            var _local_4:ITextWindow = (_window.findChildByName("pick_ribbon_title") as ITextWindow);
            if (_local_4 != null)
            {
                _local_7 = ("catalog.gift_wrapping_new.ribbon." + _SafeStr_4895);
                _local_1 = _localization.getLocalizationRaw(_local_7);
                _local_6 = _local_7;
                if (_local_1 != null)
                {
                    _local_6 = _local_1.value;
                };
                _local_4.text = _local_6;
            };
        }

        public function showGiftDialog():void
        {
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_11:* = null;
            var _local_3:Number;
            if (_window != null)
            {
                _window.dispose();
            };
            var _local_7:GiftWrappingConfiguration = _catalog.giftWrappingConfiguration;
            _window = (_catalog.utils.createWindow("gift_wrapping") as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            _window.center();
            addClickListener("give_gift_button", onGiveGiftButtonClick);
            addClickListener("cancel_link_region", onCancelGift);
            addClickListener("header_button_close", onCancelGift);
            var _local_8:_SafeStr_3109 = _window.findChildByName("name_input");
            if (_local_8 != null)
            {
                if (_userName != null)
                {
                    setReceiverName(_userName);
                }
                else
                {
                    focusNameField();
                };
                updateNameHint();
                _local_8.addEventListener("WE_CHANGE", onNameInputChange);
                _local_8.addEventListener("WME_DOWN", onNameInputMouseDown);
                _local_8.addEventListener("WKE_KEY_UP", onNameInputKeyUp);
                _local_8.addEventListener("WE_FOCUSED", onNameInputFocus);
                _local_8.addEventListener("WE_UNFOCUSED", onNameInputUnfocus);
            };
            var _local_9:IStaticBitmapWrapperWindow = (_window.findChildByName("gift_card") as IStaticBitmapWrapperWindow);
            if (_local_9)
            {
                _local_4 = _catalog.getProperty("catalog.gift_wrapping_new.gift_card");
                if (_local_4 != "")
                {
                    _local_9.assetUri = (("${image.library.url}Giftcards/" + _local_4) + ".png");
                };
            };
            var _local_2:_SafeStr_3158 = (_window.findChildByName("show_face_checkbox") as _SafeStr_3158);
            if (_local_2)
            {
                if (isModerator())
                {
                    _local_2.visible = true;
                    _local_2.select();
                    _local_2.addEventListener("WE_SELECT", onShowFaceSelected);
                    _local_2.addEventListener("WE_UNSELECT", onShowFaceUnselected);
                }
                else
                {
                    _local_2.visible = false;
                };
            };
            var _local_1:_SafeStr_3109 = _window.findChildByName("show_face_checkbox_title");
            if (((!(_local_1 == null)) && (!(isModerator()))))
            {
                _local_1.visible = false;
            };
            updateGiftDialogAvatarImage();
            var _local_5:_SafeStr_3109 = _window.findChildByName("message_input");
            if (_local_5 != null)
            {
                updateMessageHint();
                _local_5.addEventListener("WE_CHANGE", onMessageInputChange);
                _local_5.addEventListener("WE_FOCUSED", onMessageInputFocus);
                _local_5.addEventListener("WE_UNFOCUSED", onMessageInputUnfocus);
            };
            var _local_10:_SafeStr_3109 = _window.findChildByName("message_from");
            if (_local_10 != null)
            {
                _local_6 = _catalog.sessionDataManager.userName;
                _local_11 = "catalog.gift_wrapping_new.message_from";
                _localization.registerParameter(_local_11, "name", _local_6);
                _local_10.caption = _localization.getLocalization(_local_11, _local_6);
            };
            addClickListener("ribbon_prev", onPreviousGiftWrap);
            addClickListener("ribbon_next", onNextGiftWrap);
            addClickListener("box_prev", onPreviousGiftBox);
            addClickListener("box_next", onNextGiftBox);
            _localization.registerParameter("catalog.gift_wrapping_new.price", "price", _local_7.price.toString());
            if (_local_7.defaultStuffTypes.length > 0)
            {
                _local_3 = Math.floor((Math.random() * _local_7.defaultStuffTypes.length));
                _SafeStr_4896 = _local_7.defaultStuffTypes[_local_3];
            };
            _SafeStr_4897 = _local_7.stuffTypes;
            _SafeStr_4893 = _SafeStr_4893.concat(_local_7.boxTypes);
            _SafeStr_4893.push(_SafeStr_4896);
            _SafeStr_4898 = _local_7.ribbonTypes;
            _SafeStr_4899 = _SafeStr_4897[0];
            _SafeStr_4895 = _SafeStr_4898[0];
            _SafeStr_4894 = _catalog.getInteger("catalog.purchase.gift_wrapping.default_box_index", 0);
            if (((_SafeStr_4894 < 0) || (_SafeStr_4894 > (_SafeStr_4893.length - 1))))
            {
                _SafeStr_4894 = 0;
            };
            initColorGrid();
            updateColorGrid();
            updatePreview();
        }

        private function isModerator():Boolean
        {
            return (_catalog.sessionDataManager.hasSecurity(5));
        }

        private function isDefaultBoxSelected():Boolean
        {
            return (_SafeStr_4893[_SafeStr_4894] == _SafeStr_4896);
        }

        private function updatePreview():void
        {
            if (_SafeStr_4895 < 0)
            {
                _SafeStr_4895 = (_SafeStr_4898.length - 1);
            };
            if (_SafeStr_4895 > (_SafeStr_4898.length - 1))
            {
                _SafeStr_4895 = 0;
            };
            if (_SafeStr_4894 < 0)
            {
                _SafeStr_4894 = (_SafeStr_4893.length - 1);
            };
            if (_SafeStr_4894 > (_SafeStr_4893.length - 1))
            {
                _SafeStr_4894 = 0;
            };
            var _local_5:int = _SafeStr_4893[_SafeStr_4894];
            if (isValentinesBox(_local_5))
            {
                _SafeStr_4895 = 10;
                if (_SafeStr_4895 > (_SafeStr_4898.length - 1))
                {
                    _SafeStr_4895 = 0;
                };
            };
            var _local_2:int = ((_local_5 * 1000) + _SafeStr_4898[_SafeStr_4895]);
            if (_window == null)
            {
                return;
            };
            if (_roomEngine == null)
            {
                return;
            };
            var _local_3:String = _local_2.toString();
            var _local_6:int = _SafeStr_4899;
            var _local_1:Boolean = isDefaultBoxSelected();
            if (_local_1)
            {
                enableBoxColorAndRibbonSelectors(false);
                _local_6 = _SafeStr_4896;
                _local_3 = "";
            }
            else
            {
                if (isValentinesBox(_local_5))
                {
                    enableBoxColorAndRibbonSelectors(false);
                }
                else
                {
                    enableBoxColorAndRibbonSelectors(true);
                    if (((_local_5 >= 3) && (_local_5 <= 6)))
                    {
                        enableBoxColorSelectors(false);
                    };
                };
            };
            var _local_4:_SafeStr_3248 = _roomEngine.getFurnitureImage(_local_6, new Vector3d(180), 64, this, 0, _local_3);
            if (_local_4 == null)
            {
                return;
            };
            _SafeStr_4891 = _local_4.id;
            setImage(_local_4.data, true);
            showSuggestions(false);
            updateGiftDialogLabels();
        }

        private function initColorGrid():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_window == null)
            {
                return;
            };
            var _local_1:IItemGridWindow = (_window.findChildByName("color_grid") as IItemGridWindow);
            _local_1.destroyGridItems();
            var _local_5:_SafeStr_3133 = (_catalog.utils.createWindow("gift_palette_item") as _SafeStr_3133);
            for each (var _local_4:int in _SafeStr_4897)
            {
                _local_3 = _catalog.getFurnitureData(_local_4, "s");
                _local_2 = (_local_5.clone() as _SafeStr_3133);
                if (!((!(_local_3)) || (!(_local_2))))
                {
                    _local_2.addEventListener("WME_CLICK", onColorItemClick);
                    _local_2.findChildByName("color").color = _local_3.colours[0];
                    _local_2.id = _local_4;
                    _local_1.addGridItem(_local_2);
                };
            };
        }

        private function giveGift():void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName("name_input");
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:String = _local_3.caption;
            var _local_1:_SafeStr_3109 = _window.findChildByName("message_input");
            var _local_8:String = ((_local_1 == null) ? "" : _local_1.caption);
            var _local_9:Boolean = isDefaultBoxSelected();
            var _local_7:int = ((_local_9) ? _SafeStr_4896 : _SafeStr_4899);
            var _local_5:int = ((_local_9) ? 0 : _SafeStr_4893[_SafeStr_4894]);
            var _local_6:int = ((_local_9) ? 0 : _SafeStr_4898[_SafeStr_4895]);
            var _local_2:Boolean = isShowPurchaserName();
            _catalog.purchaseProductAsGift(_SafeStr_4786, _offerId, _SafeStr_4711, _local_4, _local_8, _local_7, _local_5, _local_6, _local_2);
        }

        private function safeDisable(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.disable();
            };
        }

        private function safeEnable(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.enable();
            };
        }

        private function onBuyButtonClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:* = null;
            safeDisable("buy_button");
            safeDisable("cancel_button");
            safeDisable("publish_check");
            if (_SafeStr_4890 == "GAME_TOKEN")
            {
                _catalog.purchaseGameTokensOffer(_SafeStr_4711);
            }
            else
            {
                _catalog.purchaseProduct(_SafeStr_4786, _offerId, _SafeStr_4711, _SafeStr_4892);
                _local_2 = _catalog.currentPage;
                if (_local_2 != null)
                {
                    _local_2.dispatchWidgetEvent(new CatalogWidgetEvent("PURCHASE"));
                };
            };
        }

        private function onGiftButtonClick(_arg_1:_SafeStr_3116):void
        {
            showGiftDialog();
            HabboTracking.getInstance().trackEventLog("Catalog", "clickConfirm", "client.buy_as_gift.clicked");
        }

        private function onClose(_arg_1:_SafeStr_3116):void
        {
            _catalog.resetPlacedOfferData();
            dispose();
        }

        private function onGiveGiftButtonClick(_arg_1:_SafeStr_3116):void
        {
            giveGift();
            enableGiftButton(false);
            _catalog.giftReceiver = null;
            _catalog.resetPlacedOfferData();
        }

        private function onCancelGift(_arg_1:_SafeStr_3116):void
        {
            _catalog.resetPlacedOfferData();
            dispose();
        }

        private function onPreviousGiftWrap(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4895--;
            updatePreview();
        }

        private function onNextGiftWrap(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4895++;
            updatePreview();
        }

        private function onPreviousGiftBox(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4894--;
            updatePreview();
        }

        private function onNextGiftBox(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4894++;
            updatePreview();
        }

        private function onNameInputChange(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 == null)
            {
                return;
            };
            updateNameHint();
            if (_receiverName == _local_2.caption)
            {
                return;
            };
            var _local_3:String = _local_2.caption.toLowerCase();
            var _local_5:Array = [];
            for each (var _local_4:String in _SafeStr_4782)
            {
                if (_local_4.toLowerCase().search(_local_3) != -1)
                {
                    _local_5.push(_local_4);
                };
                if (_local_5.length >= 10) break;
            };
            _receiverName = _local_2.caption;
            updateSuggestions(_local_5);
        }

        private function onNameInputMouseDown(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 == null)
            {
                return;
            };
            showSuggestions(false);
        }

        private function onNameInputKeyUp(_arg_1:_SafeStr_3116):void
        {
            var _local_3:Boolean;
            var _local_4:WindowKeyboardEvent = (_arg_1 as WindowKeyboardEvent);
            var _local_2:_SafeStr_3109 = _arg_1.target;
            switch (_local_4.keyCode)
            {
                case 38:
                    highlightSuggestion((_highlightIndex - 1));
                    return;
                case 40:
                    highlightSuggestion((_highlightIndex + 1));
                    if (_local_2 != null)
                    {
                        if (_local_2.caption.length == 0)
                        {
                            if (((_SafeStr_4900 == null) || (!(_SafeStr_4900.visible))))
                            {
                                _local_3 = showAllFriendSuggestions();
                                if (_local_3)
                                {
                                    highlightSuggestion(0);
                                };
                            };
                        };
                    };
                    return;
                case 13:
                    selectHighlighted();
                    return;
                case 9:
                    focusMessageField();
                    return;
                default:
                    return;
            };
        }

        private function showAllFriendSuggestions():Boolean
        {
            var _local_2:* = null;
            if (((!(_SafeStr_4782 == null)) && (_SafeStr_4782.length > 0)))
            {
                _local_2 = [];
                for each (var _local_1:String in _SafeStr_4782)
                {
                    _local_2.push(_local_1);
                    if (_local_2.length >= 10) break;
                };
                updateSuggestions(_local_2);
                showSuggestions(true);
                return (true);
            };
            return (false);
        }

        private function focusNameField():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_1:ITextFieldWindow = (_window.findChildByName("name_input") as ITextFieldWindow);
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = true;
            _local_1.focus();
        }

        private function focusMessageField():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_1:ITextFieldWindow = (_window.findChildByName("message_input") as ITextFieldWindow);
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = true;
            _local_1.focus();
        }

        private function selectHighlighted():void
        {
            if (((_SafeStr_4900 == null) || (!(_SafeStr_4900.visible))))
            {
                return;
            };
            var _local_3:IItemListWindow = (_SafeStr_4900.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            };
            var _local_1:_SafeStr_3133 = (_local_3.getListItemAt(_highlightIndex) as _SafeStr_3133);
            if (_local_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _local_1.findChildByName("name_text");
            if (_local_2 == null)
            {
                return;
            };
            setReceiverName(_local_2.caption);
            showSuggestions(false);
        }

        private function showSuggestions(_arg_1:Boolean):void
        {
            if (_SafeStr_4900 == null)
            {
                return;
            };
            _SafeStr_4900.visible = _arg_1;
            if (!_arg_1)
            {
                showMessageInput(true);
            };
        }

        private function showMessageInput(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName("message_input");
            if (_local_2 != null)
            {
                _local_2.visible = _arg_1;
            };
        }

        private function onMessageInputChange(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 == null)
            {
                return;
            };
            updateMessageHint();
        }

        private function onNameInputFocus(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 == null)
            {
                return;
            };
            updateNameHint();
        }

        private function onNameInputUnfocus(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 == null)
            {
                return;
            };
            updateNameHint();
        }

        private function onMessageInputFocus(_arg_1:_SafeStr_3116):void
        {
            updateMessageHint();
            showSuggestions(false);
        }

        private function onMessageInputUnfocus(_arg_1:_SafeStr_3116):void
        {
            updateMessageHint();
        }

        private function updateNameHint():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_1:_SafeStr_3109 = _window.findChildByName("name_input");
            if (_local_1 == null)
            {
                return;
            };
            var _local_2:String = _local_1.caption;
            if (((_local_2 == null) || (_local_2.length == 0)))
            {
                enableHint(true, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            }
            else
            {
                enableHint(false, "name_input_hint", "catalog.gift_wrapping_new.name_hint");
            };
        }

        private function updateMessageHint():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_1:_SafeStr_3109 = _window.findChildByName("message_input");
            if (_local_1 == null)
            {
                return;
            };
            var _local_2:String = _local_1.caption;
            if (((_local_2 == null) || (_local_2.length == 0)))
            {
                enableHint(true, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            }
            else
            {
                enableHint(false, "message_input_hint", "catalog.gift_wrapping_new.message_hint");
            };
        }

        private function enableHint(_arg_1:Boolean, _arg_2:String, _arg_3:String):void
        {
            var _local_4:ITextWindow = (_window.findChildByName(_arg_2) as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = _localization.getLocalization(_arg_3);
                _local_4.visible = _arg_1;
            };
        }

        private function enableRibbonSelectors(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("ribbon_prev");
            enableWindow(_local_2, _arg_1);
            var _local_3:_SafeStr_3109 = _window.findChildByName("ribbon_next");
            enableWindow(_local_3, _arg_1);
            var _local_4:_SafeStr_3109 = _window.findChildByName("pick_ribbon_title");
            enableWindow(_local_4, _arg_1);
        }

        private function enableBoxColorAndRibbonSelectors(_arg_1:Boolean):void
        {
            enableBoxColorSelectors(_arg_1);
            enableRibbonSelectors(_arg_1);
        }

        private function enableBoxColorSelectors(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _window.findChildByName("box_color_title");
            enableWindow(_local_3, _arg_1);
            var _local_2:_SafeStr_3133 = (_window.findChildByName("color_picker_container") as _SafeStr_3133);
            if (_local_2 != null)
            {
                enableWindow(_local_2, _arg_1);
            };
        }

        private function enableWindow(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
        {
            var _local_3:* = null;
            var _local_4:int;
            var _local_5:int;
            var _local_6:* = null;
            enableElement(_arg_1, _arg_2);
            if ((_arg_1 is IIterable))
            {
                _local_3 = IIterable(_arg_1).iterator;
                _local_4 = _local_3.length;
                if (_local_4 > 0)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_4)
                    {
                        _local_6 = (_local_3[_local_5] as _SafeStr_3109);
                        if (_local_6 != null)
                        {
                            enableElement(_local_6, _arg_2);
                            if ((_local_6 is IIterable))
                            {
                                enableWindow(_local_6, _arg_2);
                            };
                        };
                        _local_5++;
                    };
                };
            };
        }

        private function enableElement(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                _arg_1.blend = 1;
                _arg_1.enable();
            }
            else
            {
                _arg_1.blend = 0.5;
                _arg_1.disable();
            };
        }

        private function updateSuggestions(_arg_1:Array):void
        {
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_2:int;
            var _local_8:int;
            var _local_10:* = null;
            var _local_3:int;
            if (_SafeStr_4900 == null)
            {
                _SafeStr_4900 = (_window.findChildByName("suggestion_container") as _SafeStr_3133);
            };
            if (_SafeStr_4889 == null)
            {
                _SafeStr_4889 = (_catalog.utils.createWindow("suggestion_list_item_new") as _SafeStr_3133);
            };
            if (((_SafeStr_4900 == null) || (_SafeStr_4889 == null)))
            {
                return;
            };
            var _local_9:IItemListWindow = (_SafeStr_4900.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_9 == null)
            {
                return;
            };
            _local_9.removeListItems();
            if (_arg_1.length == 0)
            {
                showSuggestions(false);
                return;
            };
            showSuggestions(true);
            var _local_6:int;
            for each (var _local_4:String in _arg_1)
            {
                _local_5 = (_SafeStr_4889.clone() as _SafeStr_3133);
                if (_local_5 != null)
                {
                    _local_5.addEventListener("WME_CLICK", onSuggestionsClick);
                    _local_5.addEventListener("WME_OVER", onSuggestionsMouseOver);
                    _local_7 = (_local_5.findChildByName("name_text") as ITextWindow);
                    if (_local_7 != null)
                    {
                        _local_7.text = _local_4;
                        if (_receiverName != null)
                        {
                            _local_2 = _receiverName.length;
                            if (_local_2 > 0)
                            {
                                _local_8 = _local_4.toLowerCase().search(_receiverName.toLowerCase());
                                if (_local_8 != -1)
                                {
                                    _local_10 = _local_7.getTextFormat();
                                    _local_10.bold = true;
                                    _local_3 = (_local_8 + _local_2);
                                    if (_local_3 > _local_4.length)
                                    {
                                        _local_3 = _local_4.length;
                                    };
                                    _local_7.setTextFormat(_local_10, _local_8, _local_3);
                                };
                            };
                        };
                        _local_9.addListItem(_local_5);
                    };
                    _local_5.color = getColor(_local_6);
                    _local_6++;
                };
            };
            showMessageInput((_arg_1.length < 2));
            highlightSuggestion(0);
        }

        private function onSuggestionsClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.target as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:ITextWindow = (_local_2.findChildByName("name_text") as ITextWindow);
            if (_local_3 == null)
            {
                return;
            };
            setReceiverName(_local_3.text);
            showSuggestions(false);
        }

        private function onSuggestionsMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3133 = (_arg_1.target as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IItemListWindow = (_SafeStr_4900.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            };
            highlightSuggestion(_local_3.getListItemIndex(_local_2));
        }

        private function highlightSuggestion(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_4900 == null)
            {
                return;
            };
            var _local_3:IItemListWindow = (_SafeStr_4900.findChildByName("suggestion_list") as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_2 = (_local_3.getListItemAt(_highlightIndex) as _SafeStr_3133);
            if (_local_2 != null)
            {
                _local_2.color = getColor(_highlightIndex);
            };
            _highlightIndex = _arg_1;
            if (_highlightIndex < 0)
            {
                _highlightIndex = (_local_3.numListItems - 1);
            };
            if (_highlightIndex >= _local_3.numListItems)
            {
                _highlightIndex = 0;
            };
            _local_2 = (_local_3.getListItemAt(_highlightIndex) as _SafeStr_3133);
            if (_local_2 != null)
            {
                _local_2.color = 4291613146;
            };
        }

        private function getColor(_arg_1:int):uint
        {
            return (((_arg_1 % 2) == 0) ? 4293848814 : 0xFFFFFFFF);
        }

        private function setReceiverName(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("name_input");
            if (_local_2 == null)
            {
                return;
            };
            _local_2.caption = _arg_1;
            updateNameHint();
            focusMessageField();
        }

        private function onColorItemClick(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4899 = _arg_1.target.id;
            updateColorGrid();
            updatePreview();
        }

        private function updateColorGrid():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_4:int;
            if (_window == null)
            {
                return;
            };
            var _local_3:IItemGridWindow = (_window.findChildByName("color_grid") as IItemGridWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_4 = 0;
            while (_local_4 < _local_3.numGridItems)
            {
                _local_1 = (_local_3.getGridItemAt(_local_4) as _SafeStr_3133);
                if (_local_1 != null)
                {
                    _local_2 = _local_1.findChildByName("selection");
                    if (_local_2 != null)
                    {
                        _local_2.visible = (_local_1.id == _SafeStr_4899);
                    };
                };
                _local_4++;
            };
        }

        public function receiverNotFound():void
        {
            if (disposed)
            {
                return;
            };
            enableGiftButton(true);
            if (((!(_catalog)) || (!(_catalog.windowManager))))
            {
                return;
            };
            _catalog.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}", "${catalog.gift_wrapping.receiver_not_found.info}", 0, alertHandler);
        }

        private function alertHandler(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            enableGiftButton(true);
        }

        private function enableGiftButton(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3122 = (_window.findChildByName("give_gift_button") as _SafeStr_3122);
            if (_local_2 != null)
            {
                ((_arg_1) ? _local_2.enable() : _local_2.disable());
            };
        }

        public function notEnoughCredits():void
        {
            if (disposed)
            {
                return;
            };
            if (_window == null)
            {
                return;
            };
            enableGiftButton(true);
            safeEnable("header_button_close");
            var _local_1:_SafeStr_3158 = (_window.findChildByName("use_free_checkbox") as _SafeStr_3158);
            if (_local_1 != null)
            {
                _local_1.select();
            };
        }

        public function turnIntoGifting():void
        {
            var _local_1:_SafeStr_3109 = _window.findChildByName("buy_button");
            _local_1.removeEventListener("WME_CLICK", onBuyButtonClick);
            _local_1.addEventListener("WME_CLICK", onGiftButtonClick);
            _local_1.caption = "${catalog.purchase_confirmation.gift}";
            _window.caption = "${catalog.purchase_confirmation.gift.title}";
        }


    }
}//package com.sulake.habbo.catalog.purchase

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3211 = "_-M1N" (String#2666, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_4711 = "_-91K" (String#4717, DoABC#4)
// _SafeStr_4782 = "_-N1y" (String#3015, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)
// _SafeStr_4889 = "_-Ry" (String#7387, DoABC#4)
// _SafeStr_4890 = "_-91L" (String#3158, DoABC#4)
// _SafeStr_4891 = "_-eo" (String#4899, DoABC#4)
// _SafeStr_4892 = "_-P1m" (String#1893, DoABC#4)
// _SafeStr_4893 = "_-T3" (String#4336, DoABC#4)
// _SafeStr_4894 = "_-nW" (String#3404, DoABC#4)
// _SafeStr_4895 = "_-Uw" (String#3392, DoABC#4)
// _SafeStr_4896 = "_-i1y" (String#10478, DoABC#4)
// _SafeStr_4897 = "_-A1a" (String#6802, DoABC#4)
// _SafeStr_4898 = "_-tv" (String#5061, DoABC#4)
// _SafeStr_4899 = "_-Fy" (String#9079, DoABC#4)
// _SafeStr_4900 = "_-E1w" (String#4286, DoABC#4)
// _SafeStr_8323 = "_-v1C" (String#24281, DoABC#4)


