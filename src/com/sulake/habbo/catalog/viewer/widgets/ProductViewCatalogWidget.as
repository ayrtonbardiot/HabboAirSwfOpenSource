// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.catalog.viewer._SafeStr_3214;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.geom.Point;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
    import com.sulake.habbo.catalog.viewer.ProductImageConfiguration;
    import com.sulake.habbo.catalog.viewer.BundleProductContainer;
    import __AS3__.vec.Vector;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import flash.geom.Matrix;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import flash.events.Event;
    import com.sulake.habbo.room.preview.RoomPreviewer;

    public class ProductViewCatalogWidget extends CatalogWidget implements _SafeStr_3303, _SafeStr_3140, _SafeStr_3214 
    {

        private static const WALL_PAPER:int = 2;
        private static const _SafeStr_8356:int = 3;
        private static const LANDSCAPE:int = 4;

        private var _SafeStr_6553:BitmapData;
        private var _productName:_SafeStr_3109;
        private var _productDescription:_SafeStr_3109;
        private var _SafeStr_6549:_SafeStr_3264;
        private var _SafeStr_6548:_SafeStr_3133;
        private var _SafeStr_6514:_SafeStr_3189;
        private var _previewOffset:Point;
        private var _bundleGrid:IItemGridWindow;
        protected var _gridItemLayout:XML;
        private var _SafeStr_6555:Array;
        private var _overrideStuffData:IStuffData;
        private var _SafeStr_6556:SelectProductEvent = null;
        private var _catalog:HabboCatalog;
        private var _SafeStr_6546:_SafeStr_3109;
        private var _SafeStr_6552:Boolean = true;
        private var _SafeStr_6551:Boolean = false;
        private var _SafeStr_6554:Boolean = true;
        private var _offer:_SafeStr_3141;
        private var _SafeStr_6550:Boolean;

        public function ProductViewCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        private static function ninjaEffectBundled(_arg_1:SelectProductEvent):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_4:Boolean;
            if (_arg_1.offer.productContainer.products.length == 2)
            {
                _local_3 = 0;
                while (_local_3 < 2)
                {
                    _local_2 = _arg_1.offer.productContainer.products[_local_3];
                    if (((_local_2.productType == "e") && (_local_2.productClassId == 108)))
                    {
                        _local_4 = true;
                    };
                    _local_3++;
                };
            };
            return (_local_4);
        }


        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener("SELECT_PRODUCT", onPreviewProduct);
                events.removeEventListener("CWE_SET_PREVIEWER_STUFFDATA", onStuffDataSet);
                events.removeEventListener("CWSE_VALUE_CHANGED", onSpinnerEvent);
                events.removeEventListener("TOTAL_PRICE_WIDGET_INITIALIZED", onTotalPriceWidgetInitialized);
                _catalog = null;
                _SafeStr_6546 = null;
                super.dispose();
                _SafeStr_6553 = null;
                _SafeStr_6548 = null;
            };
        }

        override public function init():Boolean
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("productViewWidget");
            if (!_isEmbedded)
            {
                _window.getChildAt(0).width = _window.width;
                _window.getChildAt(0).height = _window.height;
            };
            if (_window.tags.indexOf("2X") > -1)
            {
            };
            _SafeStr_6554 = (_window.tags.indexOf("NO_ROOM_CANVAS") == -1);
            _SafeStr_6546 = null;
            _productName = _window.findChildByName("ctlg_product_name");
            _productName.caption = "";
            _productDescription = _window.findChildByName("ctlg_description");
            _productDescription.caption = "";
            (_productName as ITextWindow).textColor = 0;
            (_productDescription as ITextWindow).textColor = 0;
            _SafeStr_6549 = (_window.findChildByName("ctlg_teaserimg_1") as _SafeStr_3264);
            _SafeStr_6548 = (_window.findChildByName("room_canvas_container") as _SafeStr_3133);
            if (_SafeStr_6548 != null)
            {
                _SafeStr_6548.visible = false;
                _SafeStr_6514 = (_SafeStr_6548.findChildByName("room_canvas") as _SafeStr_3189);
                _local_4 = (page.viewer.catalog as HabboCatalog).roomPreviewer;
                if (((!(_SafeStr_6514 == null)) && (!(_local_4 == null))))
                {
                    _SafeStr_6548.procedure = roomCanvasContainerProcedure;
                    _local_4.disableUpdate = false;
                    _local_4.reset(false);
                    _local_3 = _local_4.getRoomCanvas(_SafeStr_6514.width, _SafeStr_6514.height);
                    if (_local_3 != null)
                    {
                        _SafeStr_6514.setDisplayObject(_local_3);
                    };
                }
                else
                {
                    _SafeStr_6548 = null;
                    _SafeStr_6514 = null;
                };
            };
            _previewOffset = new Point(_SafeStr_6549.x, _SafeStr_6549.y);
            _bundleGrid = (_window.findChildByName("bundleGrid") as IItemGridWindow);
            if (_bundleGrid == null)
            {
                _SafeStr_14.log("[Product View Catalog Widget] Bundle Grid not initialized!");
            };
            var _local_2:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            _gridItemLayout = (_local_2.content as XML);
            var _local_1:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName("ctlg_dyndeal_background") as BitmapDataAsset);
            _SafeStr_6553 = (_local_1.content as BitmapData);
            events.addEventListener("SELECT_PRODUCT", onPreviewProduct);
            events.addEventListener("CWE_SET_PREVIEWER_STUFFDATA", onStuffDataSet);
            events.addEventListener("CWSE_VALUE_CHANGED", onSpinnerEvent);
            events.addEventListener("TOTAL_PRICE_WIDGET_INITIALIZED", onTotalPriceWidgetInitialized);
            return (true);
        }

        private function roomCanvasContainerProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    if (_catalog.roomPreviewer != null)
                    {
                        _catalog.roomPreviewer.changeRoomObjectState();
                    };
                    return;
                case "WME_UP":
                case "WME_OVER":
                    _SafeStr_6550 = false;
                    return;
                case "WME_DOWN":
                    _SafeStr_6550 = true;
                    return;
                case "WME_OUT":
                    if (_SafeStr_6550)
                    {
                        if (_catalog.isDraggable(_offer))
                        {
                            _catalog.requestSelectedItemToMover(this, _offer);
                        };
                    };
                    _SafeStr_6550 = false;
                    return;
            };
        }

        private function onPreviewProduct(_arg_1:SelectProductEvent):void
        {
            var _local_28:* = null;
            var _local_33:* = null;
            var _local_27:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_24:* = null;
            var _local_8:* = null;
            var _local_19:* = null;
            var _local_15:*;
            var _local_23:* = null;
            var _local_29:* = null;
            var _local_22:* = null;
            var _local_10:* = null;
            var _local_21:* = null;
            var _local_3:* = null;
            var _local_34:* = null;
            var _local_12:* = null;
            var _local_32:* = null;
            var _local_25:* = null;
            var _local_13:* = null;
            var _local_5:* = null;
            var _local_18:uint;
            var _local_16:* = null;
            var _local_9:* = null;
            var _local_30:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_26:* = null;
            var _local_31:int;
            var _local_11:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_6556 = _arg_1;
            removeEffectSprites();
            var _local_14:_SafeStr_3141 = _arg_1.offer;
            _offer = _local_14;
            if (_bundleGrid != null)
            {
                _bundleGrid.visible = false;
                _bundleGrid.destroyGridItems();
            };
            _productName.caption = _local_14.localizationName;
            _productDescription.caption = _local_14.localizationDescription;
            _productDescription.y = (_productName.y + _productName.height);
            if ((((_catalog.multiplePurchaseEnabled) && (_local_14.bundlePurchaseAllowed)) && (_SafeStr_6551)))
            {
                setSpinnerToBundleRuleset();
                setBundleInfoWidgetToOffer(_local_14);
                _SafeStr_6552 = false;
            }
            else
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_HIDE"));
                events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent("CWPPEIE_HIDE"));
                _SafeStr_6552 = true;
            };
            if (_SafeStr_6552)
            {
                _SafeStr_6546 = _catalog.utils.showPriceOnProduct(_local_14, _window, _SafeStr_6546, _SafeStr_6549, -6, false, 6, page.acceptSeasonCurrencyAsCredits, page.acceptSeasonCurrencyAsCredits);
            }
            else
            {
                if (_SafeStr_6546 != null)
                {
                    _window.removeChild(_SafeStr_6546);
                    _SafeStr_6546.dispose();
                    _SafeStr_6546 = null;
                };
            };
            if (((!(_local_14.badgeCode == null)) && (!(_local_14.badgeCode == ""))))
            {
                _catalog.utils.showBadgeOnProduct(_local_14.badgeCode, _window, 6, 38, true, false);
            }
            else
            {
                if (ninjaEffectBundled(_arg_1))
                {
                    _catalog.utils.showAssetImageAsBadgeOnProduct("catalogue_effects_ninja", _window, 6, 38, true, false);
                }
                else
                {
                    _catalog.utils.hideBadgeFromProduct(_window);
                };
            };
            if (ProductImageConfiguration.hasProductImage(_local_14.localizationId))
            {
                setPreviewFromAsset(ProductImageConfiguration.PRODUCT_IMAGES[_local_14.localizationId]);
                if (_SafeStr_6548 != null)
                {
                    _SafeStr_6548.visible = false;
                };
            }
            else
            {
                _local_27 = new Point(0, 0);
                _local_4 = _catalog.roomPreviewer;
                switch (_local_14.pricingModel)
                {
                    case "pricing_model_bundle":
                        _local_33 = _SafeStr_6553.clone();
                        if (_bundleGrid != null)
                        {
                            _bundleGrid.visible = true;
                            _local_2 = (_local_14.productContainer as BundleProductContainer);
                            _local_2.populateItemGrid(_bundleGrid, _gridItemLayout);
                            _bundleGrid.scrollV = 0;
                        };
                        if (_SafeStr_6548 != null)
                        {
                            _SafeStr_6548.visible = false;
                        };
                        break;
                    case "pricing_model_single":
                    case "pricing_model_multi":
                    case "pricing_model_furniture":
                        _local_24 = _local_14.product;
                        if (((!(_SafeStr_6548 == null)) && (_SafeStr_6554)))
                        {
                            if ((((_local_24.productType == "s") || (_local_24.productType == "i")) || (_local_24.productType == "e")))
                            {
                                _SafeStr_6548.visible = true;
                            }
                            else
                            {
                                _SafeStr_6548.visible = false;
                            };
                        };
                        if (((!(_local_4 == null)) && (!(_SafeStr_6514 == null))))
                        {
                            _local_4.addViewOffset.y = ((_local_24.isUniqueLimitedItem) ? -15 : 0);
                            _local_4.disableUpdate = false;
                        };
                        switch (_local_24.productType)
                        {
                            case "s":
                                if (((!(_local_4 == null)) && (!(_SafeStr_6514 == null))))
                                {
                                    if (((_local_24 == null) || (_local_24.furnitureData == null))) break;
                                    if (_local_24.furnitureData.category == 23)
                                    {
                                        _local_19 = _catalog.sessionDataManager.getFloorItemData(_local_24.furnitureData.id);
                                        _local_15 = new Vector.<int>(0);
                                        _local_23 = _local_19.customParams.split(",");
                                        for each (var _local_20:String in _local_23)
                                        {
                                            if ((page.viewer.catalog as HabboCatalog).avatarRenderManager.isValidFigureSetForGender(parseInt(_local_20), (page.viewer.catalog as HabboCatalog).sessionDataManager.gender))
                                            {
                                                _local_15.push(parseInt(_local_20));
                                            };
                                        };
                                        _local_28 = (page.viewer.catalog as HabboCatalog).avatarRenderManager.getFigureStringWithFigureIds((page.viewer.catalog as HabboCatalog).sessionDataManager.figure, (page.viewer.catalog as HabboCatalog).sessionDataManager.gender, _local_15);
                                        _local_4.addAvatarIntoRoom(_local_28, _local_24.productClassId);
                                    }
                                    else
                                    {
                                        _local_4.addFurnitureIntoRoom(_local_24.productClassId, new Vector3d(90, 0, 0), _overrideStuffData);
                                    };
                                }
                                else
                                {
                                    _local_8 = page.viewer.roomEngine.getFurnitureImage(_local_24.productClassId, new Vector3d(90, 0, 0), 64, this, 0, _local_24.extraParam, -1, -1, _overrideStuffData);
                                    _local_14.previewCallbackId = _local_8.id;
                                };
                                break;
                            case "i":
                                if ((((_local_24.furnitureData.category == 2) || (_local_24.furnitureData.category == 3)) || (_local_24.furnitureData.category == 4)))
                                {
                                    _local_29 = _catalog.roomEngine.getRoomStringValue(_catalog.roomEngine.activeRoomId, "room_wall_type");
                                    _local_22 = _catalog.roomEngine.getRoomStringValue(_catalog.roomEngine.activeRoomId, "room_floor_type");
                                    _local_10 = _catalog.roomEngine.getRoomStringValue(_catalog.roomEngine.activeRoomId, "room_landscape_type");
                                    _local_29 = (((_local_29) && (_local_29.length > 0)) ? _local_29 : "101");
                                    _local_22 = (((_local_22) && (_local_22.length > 0)) ? _local_22 : "101");
                                    _local_10 = (((_local_10) && (_local_10.length > 0)) ? _local_10 : "1.1");
                                    _local_4.updateRoomWallsAndFloorVisibility(true, true);
                                    _local_21 = ((_local_24.furnitureData.category == 3) ? _local_24.extraParam : _local_22);
                                    _local_3 = ((_local_24.furnitureData.category == 2) ? _local_24.extraParam : _local_29);
                                    _local_34 = ((_local_24.furnitureData.category == 4) ? _local_24.extraParam : _local_10);
                                    _local_4.updateObjectRoom(_local_21, _local_3, _local_34);
                                    if (_local_24.furnitureData.category == 4)
                                    {
                                        _local_12 = _catalog.getFurnitureDataByName("ads_twi_windw", "i");
                                        _local_4.addWallItemIntoRoom(_local_12.id, new Vector3d(90, 0, 0), _local_12.customParams);
                                    };
                                }
                                else
                                {
                                    if (((!(_local_4 == null)) && (!(_SafeStr_6514 == null))))
                                    {
                                        _local_4.addWallItemIntoRoom(_local_24.productClassId, new Vector3d(90, 0, 0), _local_24.extraParam);
                                    }
                                    else
                                    {
                                        _local_8 = page.viewer.roomEngine.getWallItemImage(_local_24.productClassId, new Vector3d(90, 0, 0), 64, this, 0, _local_24.extraParam);
                                        _local_14.previewCallbackId = _local_8.id;
                                    };
                                };
                                break;
                            case "r":
                                _local_32 = _catalog.avatarRenderManager.createAvatarImage(_local_24.extraParam, "h", null);
                                _local_32.appendAction("gest", "sml");
                                _local_32.setDirection("full", 4);
                                _local_32.setDirection("head", 3);
                                _local_33 = _local_32.getCroppedImage("full");
                                break;
                            case "e":
                                if (((!(_local_4 == null)) && (!(_SafeStr_6514 == null))))
                                {
                                    _local_25 = (page.viewer.catalog as HabboCatalog).sessionDataManager.figure;
                                    _local_4.addAvatarIntoRoom(_local_25, _local_24.productClassId);
                                }
                                else
                                {
                                    _local_13 = page.viewer.catalog.windowManager;
                                    _local_5 = (_window.findChildByName("pixelsBackground") as _SafeStr_3133);
                                    _local_18 = 4291611852;
                                    if (_local_5 != null)
                                    {
                                        _local_5.visible = true;
                                        _local_18 = _local_5.color;
                                    };
                                    _local_33 = new BitmapData(_SafeStr_6549.width, _SafeStr_6549.height, false, _local_18);
                                    _local_16 = null;
                                    _local_9 = (page.viewer.catalog as HabboCatalog);
                                    if (_local_9.avatarRenderManager != null)
                                    {
                                        _local_28 = _local_9.sessionDataManager.figure;
                                        _local_30 = _local_9.avatarRenderManager.createAvatarImage(_local_28, "h");
                                        if (_local_30 != null)
                                        {
                                            _local_30.setDirection("head", 3);
                                            _local_30.initActionAppends();
                                            _local_30.appendAction("gest", "sml");
                                            _local_30.appendAction("fx", _local_24.productClassId);
                                            _local_30.endActionAppends();
                                            _local_30.updateAnimationByFrames(1);
                                            _local_30.updateAnimationByFrames(1);
                                            _local_16 = _local_30.getImage("full", true);
                                            _local_6 = new Point(0, 0);
                                            if (_local_16 != null)
                                            {
                                                _local_7 = _local_30.avatarSpriteData;
                                                if (_local_7 != null)
                                                {
                                                };
                                                _local_6.x = ((_local_33.width - _local_16.width) / 2);
                                                _local_6.y = ((_local_33.height - _local_16.height) / 2);
                                                for each (var _local_17:ISpriteDataContainer in _local_30.getSprites())
                                                {
                                                    if (_local_17.id == "avatar")
                                                    {
                                                        _local_26 = _local_30.getLayerData(_local_17);
                                                        _local_27.x = _local_26.dx;
                                                        _local_27.y = _local_26.dy;
                                                    };
                                                };
                                            };
                                            _local_31 = 64;
                                            _local_11 = new Point(((_local_16.width - _local_31) / 2), (_local_16.height - (_local_31 / 4)));
                                            addEffectSprites(_local_33, _local_30, _local_27, _local_6.add(_local_11), false);
                                            _local_33.copyPixels(_local_16, _local_16.rect, _local_6, null, null, true);
                                            addEffectSprites(_local_33, _local_30, _local_27, _local_6.add(_local_11));
                                        };
                                    };
                                    if (_local_30)
                                    {
                                        _local_30.dispose();
                                    };
                                };
                                break;
                            case "h":
                                break;
                            default:
                                _SafeStr_14.log(("[Product View Catalog Widget] Unknown Product Type: " + _local_24.productType));
                        };
                        if (_local_8 != null)
                        {
                            _local_33 = _local_8.data;
                        };
                        break;
                    default:
                        _SafeStr_14.log(("[Product View Catalog Widget] Unknown pricing model" + _local_14.pricingModel));
                };
                setPreviewImage(_local_33, true, _local_27);
            };
            if (((((((_SafeStr_6554) && (_local_4)) && (_SafeStr_6514)) && (_SafeStr_6548)) && (_SafeStr_6514.visible)) && (_SafeStr_6548.visible)))
            {
                (_productName as ITextWindow).textColor = 0xFFFFFFFF;
                (_productDescription as ITextWindow).textColor = 0xFFFFFFFF;
            }
            else
            {
                (_productName as ITextWindow).textColor = 0xFF000000;
                (_productDescription as ITextWindow).textColor = 0xFF000000;
            };
            _window.invalidate();
        }

        private function setBundleInfoWidgetToOffer(_arg_1:_SafeStr_3141):void
        {
            var _local_2:ExtraInfoItemData = new ExtraInfoItemData(5);
            _local_2.activityPointType = _arg_1.activityPointType;
            _local_2.priceActivityPoints = _arg_1.priceInActivityPoints;
            _local_2.priceCredits = _arg_1.priceInCredits;
            _local_2.badgeCode = _arg_1.badgeCode;
            events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent("CWPPEIE_RESET", _local_2));
        }

        private function setSpinnerToBundleRuleset():void
        {
            if (_catalog.bundleDiscountEnabled)
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_RESET", 1, _catalog.utils.bundleDiscountFlatPriceSteps));
            }
            else
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_RESET", 1));
            };
            events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_SHOW"));
            if (_catalog.bundleDiscountRuleset != null)
            {
                events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_SET_MAX", _catalog.bundleDiscountRuleset.maxPurchaseSize));
            };
            events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_SET_MIN", 1));
        }

        private function addEffectSprites(_arg_1:BitmapData, _arg_2:_SafeStr_3138, _arg_3:Point, _arg_4:Point, _arg_5:Boolean=true):void
        {
            var _local_9:* = null;
            var _local_17:int;
            var _local_10:* = null;
            var _local_19:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_20:int;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_18:Number;
            var _local_12:Number;
            var _local_13:Number;
            var _local_11:* = null;
            for each (_local_9 in _arg_2.getSprites())
            {
                _local_17 = _window.getChildIndex(_SafeStr_6549);
                _local_10 = _arg_2.getLayerData(_local_9);
                _local_19 = 0;
                _local_14 = _local_9.getDirectionOffsetX(_arg_2.getDirection());
                _local_15 = _local_9.getDirectionOffsetY(_arg_2.getDirection());
                _local_16 = _local_9.getDirectionOffsetZ(_arg_2.getDirection());
                _local_20 = 0;
                if (!_arg_5)
                {
                    if (_local_16 >= 0) continue;
                }
                else
                {
                    if (_local_16 < 0) continue;
                };
                if (_local_9.hasDirections)
                {
                    _local_20 = _arg_2.getDirection();
                };
                if (_local_10 != null)
                {
                    _local_19 = _local_10.animationFrame;
                    _local_14 = (_local_14 + _local_10.dx);
                    _local_15 = (_local_15 + _local_10.dy);
                    _local_20 = (_local_20 + _local_10.directionOffset);
                };
                if (_local_20 < 0)
                {
                    _local_20 = (_local_20 + 8);
                };
                if (_local_20 > 7)
                {
                    _local_20 = (_local_20 - 8);
                };
                _local_7 = ((((((_arg_2.getScale() + "_") + _local_9.member) + "_") + _local_20) + "_") + _local_19);
                _local_6 = _arg_2.getAsset(_local_7);
                if (_local_6 != null)
                {
                    _local_8 = (_local_6.content as BitmapData).clone();
                    _local_18 = 1;
                    _local_12 = ((_arg_4.x - (1 * _local_6.offset.x)) + _local_14);
                    _local_13 = ((_arg_4.y - (1 * _local_6.offset.y)) + _local_15);
                    if (_local_9.ink == 33)
                    {
                        _local_11 = new Matrix(1, 0, 0, 1, (_local_12 - _arg_3.x), (_local_13 - _arg_3.y));
                        _arg_1.draw(_local_8, _local_11, null, "add", null, false);
                    }
                    else
                    {
                        _arg_1.copyPixels(_local_8, _local_8.rect, new Point((_local_12 - _arg_3.x), (_local_13 - _arg_3.y)));
                    };
                };
            };
        }

        private function removeEffectSprites():void
        {
            for each (var _local_1:_SafeStr_3264 in _SafeStr_6555)
            {
                _window.removeChild(_local_1);
                _local_1.dispose();
                _local_1 = null;
            };
            _SafeStr_6555 = [];
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if ((((disposed) || (page == null)) || (page.offers == null)))
            {
                return;
            };
            for each (var _local_3:_SafeStr_3141 in page.offers)
            {
                if (_local_3.previewCallbackId == _arg_1)
                {
                    setPreviewImage(_arg_2, true);
                    _local_3.previewCallbackId = 0;
                    return;
                };
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function setPreviewImage(_arg_1:BitmapData, _arg_2:Boolean, _arg_3:Point=null):void
        {
            var _local_4:* = null;
            if (((!(_SafeStr_6549 == null)) && (!(window.disposed))))
            {
                if (_arg_1 == null)
                {
                    _arg_1 = new BitmapData(1, 1);
                    _arg_2 = true;
                };
                if (_SafeStr_6549.bitmap == null)
                {
                    _SafeStr_6549.bitmap = new BitmapData(_SafeStr_6549.width, _SafeStr_6549.height, true, 0xFFFFFF);
                };
                _SafeStr_6549.bitmap.fillRect(_SafeStr_6549.bitmap.rect, 0xFFFFFF);
                _local_4 = new Point(((_SafeStr_6549.width - _arg_1.width) / 2), ((_SafeStr_6549.height - _arg_1.height) / 2));
                _SafeStr_6549.bitmap.copyPixels(_arg_1, _arg_1.rect, _local_4, null, null, true);
                _SafeStr_6549.invalidate();
                _SafeStr_6549.x = _previewOffset.x;
                _SafeStr_6549.y = _previewOffset.y;
                if (_arg_3 != null)
                {
                    _SafeStr_6549.x = (_SafeStr_6549.x + _arg_3.x);
                    _SafeStr_6549.y = (_SafeStr_6549.y + _arg_3.y);
                };
            };
            if (_arg_2)
            {
                _arg_1.dispose();
            };
        }

        private function setPreviewFromAsset(_arg_1:String):void
        {
            if ((((((!(_arg_1)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))) || (!(page.viewer.catalog.assets))))
            {
                return;
            };
            var _local_2:BitmapDataAsset = (page.viewer.catalog.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_2 == null)
            {
                retrievePreviewAsset(_arg_1);
                return;
            };
            setPreviewImage((_local_2.content as BitmapData), false);
        }

        private function retrievePreviewAsset(_arg_1:String):void
        {
            if (((((!(_arg_1)) || (!(page))) || (!(page.viewer))) || (!(page.viewer.catalog))))
            {
                return;
            };
            var _local_4:String = ((page.viewer.catalog.imageGalleryHost + _arg_1) + ".gif");
            _SafeStr_14.log(("[Product View Catalog Widget] Retrieve Product Preview Asset: " + _local_4));
            var _local_2:URLRequest = new URLRequest(_local_4);
            if (!page.viewer.catalog.assets)
            {
                return;
            };
            var _local_3:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(_arg_1, _local_2, "image/gif");
            if (!_local_3)
            {
                return;
            };
            _local_3.addEventListener("AssetLoaderEventComplete", onPreviewImageReady);
        }

        private function onPreviewImageReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                setPreviewFromAsset(_local_2.assetName);
                _local_2.removeEventListener("AssetLoaderEventComplete", onPreviewImageReady);
            };
        }

        private function onStuffDataSet(_arg_1:SetRoomPreviewerStuffDataEvent):void
        {
            var _local_2:* = null;
            _overrideStuffData = _arg_1.stuffData;
            if (_SafeStr_6556 != null)
            {
                _local_2 = (page.viewer.catalog as HabboCatalog).roomPreviewer;
                if (_local_2 != null)
                {
                    _local_2.reset(false);
                };
                onPreviewProduct(_SafeStr_6556);
            };
        }

        private function onSpinnerEvent(_arg_1:CatalogWidgetSpinnerEvent):void
        {
            var _local_2:* = null;
            if (_arg_1.type == "CWSE_VALUE_CHANGED")
            {
                _local_2 = (window.findChildByName("price_box_new") as _SafeStr_3133);
                if (((!(_local_2 == null)) && (!(_SafeStr_6556 == null))))
                {
                    _catalog.utils.showPriceInContainer(_local_2, _SafeStr_6556.offer);
                };
            };
        }

        private function onTotalPriceWidgetInitialized(_arg_1:Event):void
        {
            _SafeStr_6551 = true;
        }

        override public function closed():void
        {
            var _local_1:RoomPreviewer = (page.viewer.catalog as HabboCatalog).roomPreviewer;
            if (_local_1)
            {
                _local_1.disableUpdate = true;
            };
        }

        public function onDragAndDropDone(_arg_1:Boolean, _arg_2:String):void
        {
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3214 = "_-H1a" (String#6911, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3274 = "_-z6" (String#5709, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3323 = "_-o1w" (String#8055, DoABC#4)
// _SafeStr_6514 = "_-O1P" (String#3464, DoABC#4)
// _SafeStr_6546 = "_-z1B" (String#2055, DoABC#4)
// _SafeStr_6548 = "_-L1K" (String#3855, DoABC#4)
// _SafeStr_6549 = "_-n1a" (String#1466, DoABC#4)
// _SafeStr_6550 = "_-y5" (String#9650, DoABC#4)
// _SafeStr_6551 = "_-V1v" (String#21743, DoABC#4)
// _SafeStr_6552 = "_-DO" (String#13227, DoABC#4)
// _SafeStr_6553 = "_-m1U" (String#13661, DoABC#4)
// _SafeStr_6554 = "_-bg" (String#14392, DoABC#4)
// _SafeStr_6555 = "_-Ub" (String#19219, DoABC#4)
// _SafeStr_6556 = "_-72" (String#10920, DoABC#4)
// _SafeStr_8356 = "_-E4" (String#30006, DoABC#4)


