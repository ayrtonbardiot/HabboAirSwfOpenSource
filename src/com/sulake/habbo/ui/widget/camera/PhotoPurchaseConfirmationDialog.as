﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.camera.PhotoPurchaseConfirmationDialog

package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.camera.CameraWidget;
    import flash.display.BitmapData;
    import flash.utils.Timer;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.utils.TextWindowUtils;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.core.assets.loaders.BitmapFileLoader;
    import flash.net.URLRequest;
    import flash.display.Bitmap;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import _-du._SafeStr_450;
    import flash.events.TimerEvent;
    import com.sulake.habbo.window.utils.AlertDialogCaption;
    import com.sulake.core.window._SafeStr_3109;
    import _-du._SafeStr_505;
    import com.sulake.habbo.utils.StringUtil;
    import flash.net.navigateToURL;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.habbo.utils.HabboWebTools;

    internal class PhotoPurchaseConfirmationDialog 
    {

        private static const STATE_LOADING_IMAGE:String = "loading_image";
        private static const STATE_IMAGE_LOADED:String = "image_loaded";
        private static const STATE_WAITING_PURCHASE_TO_COMPLETE:String = "waiting_purchase_to_complete";
        private static const STATE_WAITING_PUBLISH_TO_COMPLETE:String = "waiting_publish_to_complete";
        private static const STATE_WAITING_COMPETITION_SUBMIT_TO_COMPLETE:String = "waiting_competition_submit_to_complete";
        private static const STATE_RENDERING_FAILED:String = "rendering_failed";

        private var _SafeStr_3734:String;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4981:CameraWidget;
        private var _SafeStr_4204:BitmapData;
        private var _caption:String;
        private var _SafeStr_6807:Boolean;
        private var _SafeStr_6809:Boolean = false;
        private var _SafeStr_6808:Boolean = false;
        private var _SafeStr_6812:String = null;
        private var _SafeStr_6811:Timer;
        private var _SafeStr_6810:int = 0;

        public function PhotoPurchaseConfirmationDialog(_arg_1:CameraWidget, _arg_2:String)
        {
            _SafeStr_4981 = _arg_1;
            _caption = _arg_2;
            _window = (_SafeStr_4981.getXmlWindow("photo_purchase_confirmation") as _SafeStr_3133);
            var _local_3:IItemListWindow = ((_window as _SafeStr_3263).content.getChildByName("contentlist") as IItemListWindow);
            if (_arg_1.component.getBoolean("camera.competition.enabled"))
            {
                TextWindowUtils.setHTMLLinkStyle((_window.findChildByName("competition_info") as ITextWindow), 0xFFFFFF, 0xFFFFFF, 0xFFFFFF);
            }
            else
            {
                _local_3.removeListItem(_local_3.getListItemByName("competition_wrapper"));
            };
            if (_arg_1.component.getBoolean("disclaimer.credit_spending.enabled"))
            {
                setDisclaimerAccepted(false);
            }
            else
            {
                _local_3.removeListItem(_local_3.getListItemByName("disclaimer"));
                setDisclaimerAccepted(true);
            };
            if (!_arg_1.component.getBoolean("camera.photo.publishing.enabled"))
            {
                _local_3.removeListItem(_local_3.getListItemByName("publish_wrapper"));
            };
            (_window as _SafeStr_3263).resizeToFitContent();
            setState("loading_image");
            _window.center();
            _window.procedure = windowEventHandler;
        }

        private function checkPurse(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:_SafeStr_3142 = _SafeStr_4981.catalog.getPurse();
            if (_local_3.credits < _arg_1)
            {
                _SafeStr_4981.catalog.showNotEnoughCreditsAlert();
                return (false);
            };
            if (_local_3.getActivityPointsForType(0) < _arg_2)
            {
                _SafeStr_4981.catalog.showNotEnoughActivityPointsAlert(0);
                return (false);
            };
            return (true);
        }

        private function disableButtons(_arg_1:Boolean):void
        {
            var _local_4:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("buy_button"));
            var _local_2:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("publish_button"));
            var _local_3:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("competition_button"));
            if (_local_4)
            {
                _local_4.disable();
            };
            if (_local_2)
            {
                _local_2.disable();
            };
            if (_local_3)
            {
                _local_3.disable();
            };
            if (_arg_1)
            {
                _SafeStr_3122(_window.findChildByName("cancel_button")).caption = _SafeStr_4981.localizations.getLocalization("generic.close");
                _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("camera.purchase.pleasewait");
            };
        }

        private function setState(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            _SafeStr_3734 = _arg_1;
            var _local_4:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("buy_button"));
            var _local_2:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("publish_button"));
            var _local_3:_SafeStr_3122 = _SafeStr_3122(_window.findChildByName("competition_button"));
            switch (_arg_1)
            {
                case "loading_image":
                    disableButtons(false);
                    return;
                case "image_loaded":
                    if (_SafeStr_6807)
                    {
                        _local_4.enable();
                    };
                    if (!_SafeStr_6808)
                    {
                        if (_local_2)
                        {
                            _local_2.enable();
                        };
                    };
                    if (((!(_SafeStr_6809)) && (_local_3)))
                    {
                        _local_3.enable();
                    };
                    return;
                case "waiting_purchase_to_complete":
                    disableButtons(true);
                    if (_SafeStr_4981.component.getBoolean("disclaimer.credit_spending.enabled"))
                    {
                        setDisclaimerAccepted(false);
                    };
                    return;
                case "waiting_publish_to_complete":
                    _SafeStr_6808 = true;
                    disableButtons(true);
                    return;
                case "waiting_competition_submit_to_complete":
                    _SafeStr_6809 = true;
                    disableButtons(true);
                    return;
                case "rendering_failed":
                    disableButtons(false);
                    _window.findChildByName("status_info").caption = "";
                    return;
            };
        }

        public function animateIconToToolbar():void
        {
            if (!_window)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("product_image") as _SafeStr_3264);
            var _local_4:Point = new Point();
            _local_2.getGlobalPosition(_local_4);
            var _local_1:String = "HTIE_ICON_INVENTORY";
            var _local_6:BitmapData = new BitmapData(120, 120);
            var _local_3:Number = (_local_6.width / _SafeStr_4204.width);
            var _local_5:Matrix = new Matrix(_local_3, 0, 0, _local_3, 0, 0);
            _local_6.draw(_SafeStr_4204, _local_5);
            _SafeStr_4981.component.toolbar.createTransitionToIcon(_local_1, _local_6, _local_4.x, _local_4.y);
            _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("camera.purchase.successful");
            _window.findChildByName("buy_button").caption = _SafeStr_4981.localizations.getLocalization("camera.buy.another.button.text");
            _window.findChildByName("inventory_link_area").visible = true;
            _SafeStr_6810++;
            _window.findChildByName("purchase_count").caption = "";
            _window.findChildByName("purchase_count").caption = _SafeStr_6810.toString();
            setState("image_loaded");
        }

        public function setImageUrl(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_SafeStr_4981 == null)
            {
                return;
            };
            if (((_arg_1) && (_arg_1.length > 0)))
            {
                _arg_1 = (_SafeStr_4981.component.context.configuration.getProperty("stories.image_url_base") + _arg_1);
                _local_2 = new BitmapFileLoader("image/png", new URLRequest(_arg_1));
                _local_2.addEventListener("AssetLoaderEventComplete", onImageLoaded);
            }
            else
            {
                setRenderingFailed();
                _SafeStr_4981.windowManager.alert("${generic.alert.title}", "${camera.render.count.info}", 0, null);
            };
        }

        private function onImageLoaded(_arg_1:AssetLoaderEvent):void
        {
            if (!_window)
            {
                return;
            };
            var _local_2:Bitmap = (BitmapFileLoader(_arg_1.target).content as Bitmap);
            if (_local_2)
            {
                setImage(_local_2.bitmapData);
            };
            _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("camera.confirm_phase.info");
            setState("image_loaded");
        }

        private function setImage(_arg_1:BitmapData):void
        {
            if (((_window == null) || (_arg_1 == null)))
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("product_image") as _SafeStr_3264);
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.bitmap != null)
            {
                _local_3.bitmap.dispose();
                _local_3.bitmap = null;
            };
            if (_local_3.bitmap == null)
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
            };
            var _local_2:Number = (_local_3.width / _arg_1.width);
            _local_3.bitmap.draw(_arg_1, new Matrix(_local_2, 0, 0, _local_2, 0, 0), null, null, null, true);
            _SafeStr_4204 = _arg_1;
        }

        public function setRenderingFailed():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_1:_SafeStr_3264 = (_window.findChildByName("product_image") as _SafeStr_3264);
            if (_local_1 != null)
            {
                _SafeStr_4204 = new BitmapData(_local_1.width, _local_1.height, false, 0);
                if (_local_1.bitmap == null)
                {
                    _local_1.bitmap = _SafeStr_4204;
                }
                else
                {
                    _local_1.bitmap.dispose();
                    _local_1.bitmap.draw(_SafeStr_4204);
                };
            };
            setState("rendering_failed");
        }

        public function publishingStatus(_arg_1:_SafeStr_450):void
        {
            var _local_4:int;
            var _local_3:int;
            var _local_2:* = null;
            if (_window == null)
            {
                return;
            };
            if (_arg_1.getParser().isOk())
            {
                _SafeStr_6812 = _arg_1.getParser().getExtraDataId();
                _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("camera.publish.successful");
                _window.findChildByName("publish_explanation").caption = _SafeStr_4981.localizations.getLocalization("camera.publish.successful");
                _window.findChildByName("publish_detailed_explanation").caption = _SafeStr_4981.localizations.getLocalization("camera.publish.success.short.info");
                _window.findChildByName("publish_button").visible = false;
                _window.findChildByName("publish_price_area").visible = false;
                _window.findChildByName("publish_link_area").visible = true;
                if (_SafeStr_6811 != null)
                {
                    _SafeStr_6811.reset();
                };
            }
            else
            {
                _local_4 = _arg_1.getParser().getSecondsToWait();
                _local_3 = int(((_local_4 / 60) + 1));
                _local_2 = _SafeStr_4981.localizations.registerParameter("camera.publish.wait", "minutes", _local_3.toString());
                _SafeStr_4981.windowManager.alert("${generic.alert.title}", _local_2, 0, null);
                _window.findChildByName("status_info").caption = "";
                if (_SafeStr_6811 == null)
                {
                    _SafeStr_6811 = new Timer((_local_4 * 1000), 1);
                    _SafeStr_6811.addEventListener("timerComplete", onPublishTimerComplete);
                }
                else
                {
                    _SafeStr_6811.reset();
                    _SafeStr_6811.delay = (_local_4 * 1000);
                };
                _SafeStr_6811.start();
            };
            setState("image_loaded");
        }

        private function onPublishTimerComplete(_arg_1:TimerEvent):void
        {
            var _local_2:* = null;
            _SafeStr_6808 = false;
            _SafeStr_6811 = null;
            if (_SafeStr_3734 == "image_loaded")
            {
                _local_2 = _SafeStr_3122(_window.findChildByName("publish_button"));
                _local_2.enable();
            };
        }

        public function competitionStatus(_arg_1:_SafeStr_505):void
        {
            var _local_2:* = null;
            if (((_window == null) || (_window.findChildByName("competition_wrapper") == null)))
            {
                return;
            };
            if (_arg_1.getParser().isOk())
            {
                _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("camera.competition.submitted.status");
                _window.findChildByName("competition_name").caption = _SafeStr_4981.localizations.getLocalization("camera.competition.submitted.info");
            }
            else
            {
                if (_arg_1.getParser().getErrorReason() == "too-many-submits")
                {
                    _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("generic.failed");
                    _window.findChildByName("competition_name").caption = _SafeStr_4981.localizations.getLocalization("camera.competition.limit.info");
                }
                else
                {
                    if (_arg_1.getParser().getErrorReason() == "email-not-verified")
                    {
                        _SafeStr_6809 = false;
                        _window.findChildByName("status_info").caption = _SafeStr_4981.localizations.getLocalization("generic.failed");
                        _local_2 = _SafeStr_4981.windowManager.confirm("${generic.alert.title}", "${camera.competition.email.not.verified}", (0x10 | 0x20), onEmailVerificationGo);
                        _local_2.setButtonCaption(16, new AlertDialogCaption(_SafeStr_4981.localizations.getLocalization("email.settings"), "", true));
                        _local_2.setButtonCaption(32, new AlertDialogCaption(_SafeStr_4981.localizations.getLocalization("groupforum.settings.cancel"), "", true));
                    };
                };
            };
            setState("image_loaded");
            var _local_3:_SafeStr_3109 = _window.findChildByName("competition_button");
            if (((!(_local_3 == null)) && (_local_3.y < 10)))
            {
                _local_3.y = 10;
            };
        }

        private function onEmailVerificationGo(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (_arg_2.type == "WE_OK")
            {
                _local_4 = _SafeStr_4981.component.context.configuration.getProperty("email.verification.url");
                if (!StringUtil.isEmpty(_local_4))
                {
                    _local_3 = ((_SafeStr_4981.component.getInteger("spaweb", 0) == 1) ? "" : "_blank");
                    (navigateToURL(new URLRequest(_local_4), _local_3));
                };
            };
            _arg_1.dispose();
        }

        public function setPrices(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:ITextWindow = (_window.findChildByName("purchase_credit_cost_text") as ITextWindow);
            _local_4.text = _arg_1.toString();
            var _local_5:ITextWindow = (_window.findChildByName("purchase_ducket_cost_text") as ITextWindow);
            if (_arg_2 > 0)
            {
                _local_5.text = _arg_2.toString();
            }
            else
            {
                _local_5.visible = false;
                _window.findChildByName("ducket_icon").visible = false;
            };
            var _local_6:ITextWindow = (_window.findChildByName("publish_ducket_cost_text") as ITextWindow);
            if (_local_6)
            {
                _local_6.text = _arg_3.toString();
            };
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return;
            };
            if (((!(_arg_1.type == "WME_CLICK")) && (!(_arg_1.type == "WME_DOUBLE_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "spending_disclaimer":
                    setDisclaimerAccepted(_SafeStr_3158(_arg_2).isSelected);
                    return;
                case "competition_button":
                    if (_SafeStr_3734 == "image_loaded")
                    {
                        setState("waiting_competition_submit_to_complete");
                        _SafeStr_4981.handler.confirmPhotoCompetitionSubmit();
                    };
                    return;
                case "buy_button":
                    if ((((_SafeStr_3734 == "image_loaded") && (_SafeStr_6807)) && (checkPurse(_SafeStr_4981.handler.creditPrice, _SafeStr_4981.handler.ducketPrice))))
                    {
                        setState("waiting_purchase_to_complete");
                        _SafeStr_4981.handler.confirmPhotoPurchase();
                    };
                    return;
                case "publish_button":
                    if (((_SafeStr_3734 == "image_loaded") && (checkPurse(0, _SafeStr_4981.handler.publishDucketPrice))))
                    {
                        setState("waiting_publish_to_complete");
                        _SafeStr_4981.handler.confirmPhotoPublish();
                    };
                    return;
                case "inventory_link":
                    _SafeStr_4981.component.context.createLinkEvent("inventory/open/furni");
                    return;
                case "publish_link":
                    _local_3 = _SafeStr_4981.container.sessionDataManager.userName;
                    _local_4 = ((("/profile/" + _local_3) + "/photo/") + _SafeStr_6812);
                    HabboWebTools.openPage(_local_4);
                    return;
                case "header_button_close":
                case "cancel_button":
                    _SafeStr_4981.startTakingPhoto("photoPurchaseCancel");
                    hide();
                    return;
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
            _SafeStr_6807 = _arg_1;
            if (((_arg_1) && (_SafeStr_3734 == "image_loaded")))
            {
                _local_2.enable();
            }
            else
            {
                _local_2.disable();
            };
        }

        public function hide():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4204 = null;
            _SafeStr_4981 = null;
            if (_SafeStr_6811 != null)
            {
                _SafeStr_6811.stop();
                _SafeStr_6811 = null;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_450 = "_-02z" (String#10678, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_505 = "_-xc" (String#10837, DoABC#4)
// _SafeStr_6807 = "_-70" (String#15676, DoABC#4)
// _SafeStr_6808 = "_-s15" (String#12616, DoABC#4)
// _SafeStr_6809 = "_-11R" (String#13495, DoABC#4)
// _SafeStr_6810 = "_-nP" (String#14829, DoABC#4)
// _SafeStr_6811 = "_-j1E" (String#4855, DoABC#4)
// _SafeStr_6812 = "_-UK" (String#19222, DoABC#4)


