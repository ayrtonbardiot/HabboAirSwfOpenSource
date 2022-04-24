// by nota

//com.sulake.habbo.ui.widget.furniture.externalimage.ExternalImageWidget

package com.sulake.habbo.ui.widget.furniture.externalimage
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3163;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ILabelWindow;
    import flash.text.TextField;
    import com.sulake.core.assets.loaders.BitmapFileLoader;
    import flash.display.Bitmap;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler.ExternalImageWidgetHandler;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import adobe.serialization.json.JSONDecoder;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import flash.net.URLLoader;
    import flash.events.HTTPStatusEvent;
    import flash.events.Event;
    import flash.display.Stage;
    import com.sulake.habbo.window.utils.AlertDialogCaption;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.net.navigateToURL;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.core.window.events.WindowLinkEvent;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.habbo.window.utils._SafeStr_3198;

    public class ExternalImageWidget extends RoomWidgetBase 
    {

        private static const TYPE_PHOTO_POSTER:String = "photo_poster";
        private static const TYPE_SELFIE:String = "selfie";
        private static const TYPE_LEGACY:String = "legacy";
        private static const HORIZONTAL_ITEM_SPACING:int = 10;
        private static const VERTICAL_SPACE:int = 71;

        private var _window:_SafeStr_3133;
        private var _SafeStr_4573:_SafeStr_3264;
        private var _moderationText:_SafeStr_3163;
        private var _makeOwnButton:_SafeStr_3109;
        private var _closeButton:_SafeStr_3109;
        private var _deleteButton:_SafeStr_3133;
        private var _bgBorder:_SafeStr_3109;
        private var _buttonContainer:_SafeStr_3133;
        private var _shareArea:_SafeStr_3133;
        private var _shareButton:_SafeStr_3109;
        private var _senderNameButton:IRegionWindow;
        private var _SafeStr_4571:ILabelWindow;
        private var _SafeStr_4568:TextField;
        private var _SafeStr_4572:ILabelWindow;
        private var _SafeStr_4575:BitmapFileLoader;
        private var _SafeStr_4577:Bitmap;
        private var _inventory:_SafeStr_1708;
        private var _SafeStr_4580:int;
        private var _SafeStr_4574:String;
        private var _caption:String;
        private var _SafeStr_4579:int;
        private var _SafeStr_4578:String;
        private var _reportImagebutton:_SafeStr_3133;
        private var _SafeStr_4570:String;
        private var _SafeStr_9019:_SafeStr_3264;
        private var _habboHelp:IHabboHelp;
        private var _roomEngine:IRoomEngine;
        private var reportWindow:_SafeStr_3133;
        private var _SafeStr_4569:int = 0;
        private var _SafeStr_4576:Boolean = false;
        private var _SafeStr_4147:_SafeStr_20;

        public function ExternalImageWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_1708, _arg_6:IHabboHelp, _arg_7:IRoomEngine, _arg_8:_SafeStr_20)
        {
            var _local_9:* = null;
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _window = (_arg_2.buildFromXML((_arg_3.getAssetByName("stories_image_widget_xml").content as XML)) as _SafeStr_3133);
            ownHandler.widget = this;
            _closeButton = (_window.findChildByName("closebutton") as _SafeStr_3109);
            _SafeStr_4573 = (_window.findChildByName("imageLoader") as _SafeStr_3264);
            _moderationText = (_window.findChildByName("moderationText") as _SafeStr_3163);
            _moderationText.addEventListener("WE_LINK", onClickModerationInfoLink);
            _shareArea = (_window.findChildByName("shareArea") as _SafeStr_3133);
            _deleteButton = (_window.findChildByName("removeButtonContainer") as _SafeStr_3133);
            _makeOwnButton = (_window.findChildByName("makeOwnButton") as _SafeStr_3109);
            _shareButton = (_window.findChildByName("shareButtonContainer") as _SafeStr_3109);
            _bgBorder = (_window.findChildByName("bgBorder") as _SafeStr_3109);
            _senderNameButton = (_window.findChildByName("senderNameButton") as IRegionWindow);
            _SafeStr_4571 = (_window.findChildByName("senderName") as ILabelWindow);
            _SafeStr_4568 = new TextField();
            if (ownHandler.container.roomSession.roomControllerLevel == 5)
            {
                _local_9 = (_window.findChildByName("name_copy_wrapper") as _SafeStr_3189);
                _SafeStr_4568.textColor = 10061943;
                _SafeStr_4568.text = "";
                _local_9.setDisplayObject(_SafeStr_4568);
            };
            _SafeStr_4572 = (_window.findChildByName("creationDate") as ILabelWindow);
            _buttonContainer = (_window.findChildByName("buttonContainer") as _SafeStr_3133);
            _inventory = _arg_5;
            _habboHelp = _arg_6;
            _roomEngine = _arg_7;
            _reportImagebutton = (_window.findChildByName("reportButtonContainer") as _SafeStr_3133);
            _window.procedure = onWindowEvent;
            _window.center();
            _shareArea.visible = false;
            _SafeStr_4147 = _arg_8;
            hide();
        }

        private function get ownHandler():ExternalImageWidgetHandler
        {
            return (_SafeStr_3914 as ExternalImageWidgetHandler);
        }

        public function showWithRoomObject(_arg_1:IRoomObject):void
        {
            _SafeStr_4580 = _arg_1.getId();
            _SafeStr_4570 = _arg_1.getType();
            _SafeStr_4576 = false;
            _deleteButton.visible = ownHandler.hasRightsToRemove();
            if (getType() == "photo_poster")
            {
                _reportImagebutton.visible = true;
            }
            else
            {
                _reportImagebutton.visible = ownHandler.isSelfieReportingEnabled();
            };
            show(_arg_1.getModel().getString("furniture_data"));
            var _local_2:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
            if (_local_2.indexOf(_arg_1) != -1)
            {
                _SafeStr_4569 = _local_2.indexOf(_arg_1);
            };
        }

        public function showWithFurniID(_arg_1:int):void
        {
            var _local_2:_SafeStr_3154 = _inventory.getWallItemById(_arg_1);
            if (_local_2)
            {
                _SafeStr_4580 = _arg_1;
                _SafeStr_4570 = _roomEngine.getWallItemType(_local_2.type);
                _SafeStr_4576 = true;
                _deleteButton.visible = false;
                _reportImagebutton.visible = false;
                show(_local_2.stuffData.getLegacyString());
            };
        }

        private function show(_arg_1:String):void
        {
            if (ownHandler.storiesImageUrlBase == "disabled")
            {
                return;
            };
            clearImage();
            if (_arg_1 != null)
            {
                readFurniJson(_arg_1);
            };
        }

        private function showNext():void
        {
            var _local_1:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
            if (_local_1.length > 0)
            {
                _SafeStr_4569++;
                if (_SafeStr_4569 > (_local_1.length - 1))
                {
                    _SafeStr_4569 = 0;
                };
                showWithRoomObject(_local_1[_SafeStr_4569]);
            };
        }

        private function showPrevious():void
        {
            var _local_1:Vector.<IRoomObject> = getWallItemsOfCurrentTypeInRoom();
            if (_local_1.length > 0)
            {
                _SafeStr_4569--;
                if (_SafeStr_4569 < 0)
                {
                    _SafeStr_4569 = (_local_1.length - 1);
                };
                showWithRoomObject(_local_1[_SafeStr_4569]);
            };
        }

        private function getWallItemsOfCurrentTypeInRoom():Vector.<IRoomObject>
        {
            var _local_2:Vector.<IRoomObject> = new Vector.<IRoomObject>();
            var _local_3:Array = _roomEngine.getObjectsByCategory(20);
            for each (var _local_1:IRoomObject in _local_3)
            {
                if (_local_1.getType() == _SafeStr_4570)
                {
                    _local_2.push(_local_1);
                };
            };
            return (_local_2);
        }

        private function clearImage():void
        {
            _SafeStr_4574 = null;
            _caption = "";
            var _local_1:ITextWindow = (_window.findChildByName("captionText") as ITextWindow);
            _local_1.text = "";
            _senderNameButton.visible = false;
            _SafeStr_4579 = 0;
            _SafeStr_4571.caption = "";
            _SafeStr_4568.text = "";
            _SafeStr_4572.caption = "";
            _SafeStr_4578 = null;
            _moderationText.visible = false;
            drawImage(new Bitmap(new BitmapData((_SafeStr_4573.width - 2), (_SafeStr_4573.height - 2), false, 0)));
        }

        private function readFurniJson(_arg_1:String):void
        {
            try
            {
                _SafeStr_4574 = new JSONDecoder(_arg_1, false).getValue().id;
                if (_SafeStr_4574)
                {
                    loadExternalData();
                    return;
                };
                loadPhoto(_arg_1, getImageUrl(new JSONDecoder(_arg_1, false).getValue()));
            }
            catch(error:Error)
            {
            };
        }

        private function getImageUrl(_arg_1:Object):String
        {
            var _local_3:* = null;
            var _local_2:String = getJsonValue(_arg_1, "w", "url");
            if (_local_2.indexOf("http") != 0)
            {
                _local_3 = "postcards/selfie/";
                if (getType() == "photo_poster")
                {
                    _local_3 = "";
                };
                if (_local_2.indexOf(".png") == -1)
                {
                    _local_2 = (_local_2 + ".png");
                };
                _local_2 = ((ownHandler.storiesImageUrlBase + _local_3) + _local_2);
            };
            return (_local_2);
        }

        private function loadPhoto(_arg_1:String, _arg_2:String):void
        {
            var _local_8:* = null;
            var _local_3:* = null;
            var _local_10:* = null;
            var _local_7:* = null;
            try
            {
                _local_8 = new JSONDecoder(_arg_1, false).getValue();
            }
            catch(error:Error)
            {
                return;
            };
            if (!_arg_2)
            {
                _arg_2 = getImageUrl(_local_8);
            };
            _SafeStr_4575 = new BitmapFileLoader("image/png", new URLRequest(_arg_2));
            _SafeStr_4575.addEventListener("AssetLoaderEventComplete", onImageLoaded);
            var _local_4:String = getJsonValue(_local_8, "n", "creator_name");
            var _local_5:String = getJsonValue(_local_8, "s", "creator_id");
            var _local_11:String = getJsonValue(_local_8, "u", "unique_id");
            var _local_6:String = getJsonValue(_local_8, "t", "time");
            var _local_9:Date = new Date(_local_6);
            if (_local_4)
            {
                _SafeStr_4571.caption = _local_4;
                _senderNameButton.visible = true;
                _SafeStr_4568.text = _local_4;
                _SafeStr_4579 = _local_5;
                _SafeStr_4572.caption = ((((_local_9.date + "-") + (_local_9.month + 1)) + "-") + _local_9.fullYear);
            };
            if (((ownHandler.storiesImageShareUrl) && (ownHandler.storiesImageShareUrl.length > 4)))
            {
                _local_3 = (_window.findChildByName("urlField") as _SafeStr_3109);
                _local_10 = ownHandler.storiesImageShareUrl.replace("%id%", _local_11);
                _local_3.caption = _local_10;
                _SafeStr_4578 = _local_10;
            };
            _caption = getJsonValue(_local_8, "m", "caption");
            if (_caption)
            {
                _local_7 = (_window.findChildByName("captionText") as ITextWindow);
                _local_7.text = _caption;
            };
        }

        private function getJsonValue(_arg_1:Object, _arg_2:String, _arg_3:String=null):String
        {
            var _local_4:* = null;
            _local_4 = _arg_1[_arg_2];
            if (((!(_local_4)) && (_arg_3)))
            {
                _local_4 = _arg_1[_arg_3];
            };
            return (_local_4);
        }

        private function onImageLoaded(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:* = null;
            if (_SafeStr_4575)
            {
                _local_2 = (_SafeStr_4575.content as Bitmap);
                if (_local_2)
                {
                    _SafeStr_4573.width = (_local_2.width + 2);
                    _SafeStr_4573.height = (_local_2.height + 2);
                    drawImage(_local_2);
                };
            };
        }

        private function drawImage(_arg_1:Bitmap):void
        {
            _SafeStr_4577 = _arg_1;
            _SafeStr_4573.bitmap = new BitmapData(_SafeStr_4573.width, _SafeStr_4573.height, true, 0);
            _window.visible = true;
            var _local_3:_SafeStr_3109 = _window.findChildByName("previousButton");
            var _local_2:_SafeStr_3109 = _window.findChildByName("nextButton");
            _local_3.x = 10;
            var _local_6:* = 0;
            _bgBorder.x = _local_6;
            _bgBorder.y = _local_6;
            _SafeStr_4573.x = ((10 * 2) + _local_3.width);
            _SafeStr_4573.y = 71;
            _local_6 = (_SafeStr_4573.height + (71 * 2));
            _window.height = _local_6;
            _bgBorder.height = _local_6;
            _local_6 = ((_SafeStr_4573.width + (10 * 4)) + (_local_3.width * 2));
            _window.width = _local_6;
            _bgBorder.width = _local_6;
            _senderNameButton.x = ((_SafeStr_4573.right - _senderNameButton.width) - 3);
            _senderNameButton.y = (_SafeStr_4573.bottom + 3);
            _SafeStr_4572.x = (_SafeStr_4573.x + 3);
            _local_6 = _SafeStr_4573.bottom;
            _senderNameButton.y = _local_6;
            _SafeStr_4572.y = _local_6;
            _buttonContainer.y = 0;
            _buttonContainer.x = (_bgBorder.right - _buttonContainer.width);
            _local_2.x = (_SafeStr_4573.right + 10);
            if (_SafeStr_4576)
            {
                _local_6 = false;
                _local_3.visible = _local_6;
                _local_2.visible = _local_6;
            }
            else
            {
                _local_6 = (getWallItemsOfCurrentTypeInRoom().length > 1);
                _local_3.visible = _local_6;
                _local_2.visible = _local_6;
            };
            var _local_4:Matrix = new Matrix();
            var _local_5:ColorTransform = new ColorTransform();
            _local_5.color = 0;
            _local_4.ty = (_local_4.ty + 1);
            _SafeStr_4573.bitmap.draw(_arg_1, _local_4, _local_5);
            _local_4.tx = (_local_4.tx + 1);
            _local_4.ty = (_local_4.ty - 1);
            _SafeStr_4573.bitmap.draw(_arg_1, _local_4, _local_5);
            _local_4.ty = (_local_4.ty + 2);
            _SafeStr_4573.bitmap.draw(_arg_1, _local_4, _local_5);
            _local_4.ty = (_local_4.ty - 1);
            _local_4.tx = (_local_4.tx + 1);
            _SafeStr_4573.bitmap.draw(_arg_1, _local_4, _local_5);
            _local_4.tx = (_local_4.tx - 1);
            _SafeStr_4573.bitmap.draw(_arg_1, _local_4);
            _window.activate();
            updateWindowPosition();
        }

        private function loadExternalData():void
        {
            var _local_2:String = (ownHandler.extraDataServiceUrl + _SafeStr_4574);
            var _local_1:URLLoader = new URLLoader(new URLRequest(_local_2));
            _local_1.addEventListener("httpStatus", onExternalDataHttpStatus);
            _local_1.addEventListener("complete", onExternalDataLoaded);
            _local_1.addEventListener("ioError", onExternalDataError);
        }

        private function onExternalDataHttpStatus(_arg_1:HTTPStatusEvent):void
        {
            if (((_arg_1.status == 403) && (ownHandler.hasRightsToRemove())))
            {
                _moderationText.visible = true;
            };
        }

        private function onExternalDataError(_arg_1:Event):void
        {
            if (!_moderationText.visible)
            {
                _SafeStr_14.log(("Extra data loading failed: " + _arg_1.toString()));
            };
        }

        private function onExternalDataLoaded(_arg_1:Event):void
        {
            var _local_2:String = URLLoader(_arg_1.target).data;
            if (_local_2.length == 0)
            {
                return;
            };
            loadPhoto(_local_2, null);
        }

        override public function dispose():void
        {
            if (!_window)
            {
                return;
            };
            _SafeStr_4573 = null;
            _closeButton = null;
            _bgBorder = null;
            _makeOwnButton = null;
            _deleteButton = null;
            _SafeStr_4575 = null;
            _inventory = null;
            _habboHelp = null;
            _roomEngine = null;
            _SafeStr_4579 = 0;
            _senderNameButton = null;
            _SafeStr_4568 = null;
            _buttonContainer = null;
            _shareArea = null;
            _window.procedure = null;
            _window.dispose();
            _SafeStr_4147 = null;
            super.dispose();
            if (reportWindow)
            {
                reportWindow.destroy();
            };
        }

        public function hide():void
        {
            _window.visible = false;
        }

        private function updateWindowPosition():void
        {
            if (!_SafeStr_4577)
            {
                _window.center();
                return;
            };
            var _local_5:Stage = _SafeStr_4147.context.displayObjectContainer.stage;
            var _local_1:Number = ((_local_5.stageWidth - 100) / _SafeStr_4577.width);
            var _local_3:Number = ((_local_5.stageHeight - 200) / _SafeStr_4577.height);
            if (_local_1 < 1)
            {
                _window.x = 50;
            }
            else
            {
                _window.x = ((_local_5.stageWidth - _window.width) * 0.5);
            };
            if (_local_3 < 1)
            {
                _window.y = 50;
            }
            else
            {
                _window.y = ((_local_5.stageHeight - _window.height) * 0.5);
            };
            var _local_4:_SafeStr_3109 = _window.findChildByName("previousButton");
            var _local_2:_SafeStr_3109 = _window.findChildByName("nextButton");
            var _local_6:int = _SafeStr_4147.context.displayObjectContainer.stage.stageHeight;
            if (_bgBorder.height > _local_6)
            {
                var _local_7:* = ((_local_6 / 2) - (_local_4.height / 2));
                _local_2.y = _local_7;
                _local_4.y = _local_7;
            }
            else
            {
                _local_7 = ((_bgBorder.height / 2) - (_local_4.height / 2));
                _local_2.y = _local_7;
                _local_4.y = _local_7;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_arg_2 == _window)
            {
                switch (_arg_1.type)
                {
                    case "WE_PARENT_RESIZED":
                        updateWindowPosition();
                };
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "closebutton":
                    hide();
                    return;
                case "removebutton":
                    _local_3 = windowManager.confirm(_SafeStr_4020.getLocalization("inventory.remove.external_image_wallitem_header"), _SafeStr_4020.getLocalization("inventory.remove.external_image_wallitem_body"), 0, onDeleteConfirm);
                    _local_3.setButtonCaption(16, new AlertDialogCaption(_SafeStr_4020.getLocalization("inventory.remove.external_image_wallitem_delete"), "", true));
                    return;
                case "makeOwnButton":
                    if (getType() == "photo_poster")
                    {
                        _local_4 = new HabboToolbarEvent("HTE_ICON_CAMERA");
                        _local_4.iconName = "imageWidgetMakeOwn";
                        ownHandler.container.toolbar.events.dispatchEvent(_local_4);
                        hide();
                    }
                    else
                    {
                        if (_SafeStr_4147.getInteger("spaweb", 0) == 1)
                        {
                            HabboWebTools.openPage("/stories/cards/selfie/edit");
                        }
                        else
                        {
                            _SafeStr_4147.context.createLinkEvent("games/play/elisa_habbo_stories?ref=btn_selfie_myo");
                        };
                    };
                    return;
                case "shareButton":
                    _shareArea.visible = true;
                    HabboTracking.getInstance().trackEventLog("Stories", "shareopened", "stories.share.clicked", _SafeStr_4570);
                    return;
                case "twitterShare":
                    (navigateToURL(new URLRequest(("http://www.twitter.com/share?url=" + _SafeStr_4578)), "_blank"));
                    HabboTracking.getInstance().trackEventLog("Stories", "twitter", "stories.share.clicked", _SafeStr_4570);
                    return;
                case "fbShare":
                    (navigateToURL(new URLRequest(("https://www.facebook.com/sharer/sharer.php?u=" + _SafeStr_4578)), "_blank"));
                    HabboTracking.getInstance().trackEventLog("Stories", "facebook", "stories.share.clicked", _SafeStr_4570);
                    return;
                case "senderNameButton":
                    ownHandler.sendMessage(new _SafeStr_313(_SafeStr_4579));
                    return;
                case "urlField":
                    _local_5 = (_window.findChildByName("urlField") as ITextFieldWindow);
                    _local_5.setSelection(0, _local_5.length);
                    HabboTracking.getInstance().trackEventLog("Stories", "fieldselected", "stories.share.clicked", _SafeStr_4570);
                    return;
                case "reportButton":
                    openReportImage();
                    return;
                case "nextButton":
                    showNext();
                    return;
                case "previousButton":
                    showPrevious();
                    return;
            };
        }

        private function onClickModerationInfoLink(_arg_1:WindowLinkEvent):void
        {
            if (((!(_arg_1 == null)) && (!(StringUtil.isBlank(_arg_1.link)))))
            {
                (navigateToURL(new URLRequest(_arg_1.link), "_blank"));
            };
        }

        private function openReportImage():void
        {
            _habboHelp.startPhotoReportingInNewCfhFlow(_SafeStr_4579, _SafeStr_4571.caption, _SafeStr_4574, _SafeStr_4580);
        }

        private function getType():String
        {
            switch (_SafeStr_4570)
            {
                case "external_image_wallitem_poster":
                case "external_image_wallitem_poster_small":
                    return ("photo_poster");
                case "external_image_wallitem":
                    return ("selfie");
            };
            return ("legacy");
        }

        private function onReportWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            var _local_9:* = null;
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_5:Boolean;
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    reportWindow.destroy();
                    return;
                case "report_confirm":
                    _local_3 = 0;
                    _local_9 = reportWindow.findChildByName("reporting_reason");
                    if (_local_9 != null)
                    {
                        _local_8 = ISelectorWindow(_local_9).getSelected();
                        if (_local_8 != null)
                        {
                            _local_3 = _local_8.name;
                        };
                    };
                    _local_6 = null;
                    _local_4 = reportWindow.findChildByName("input_widget");
                    if (_local_4 != null)
                    {
                        _local_7 = ((_local_4 as _SafeStr_3199).widget as IIlluminaInputWidget);
                        _local_6 = _local_7.message;
                    };
                    if (!_SafeStr_4578)
                    {
                        _SafeStr_4578 = "url not available";
                    };
                    if (getType() == "photo_poster")
                    {
                        _local_5 = _habboHelp.reportPhoto(_SafeStr_4574, _local_3, _roomEngine.activeRoomId, _SafeStr_4579, _SafeStr_4580);
                    }
                    else
                    {
                        _local_5 = _habboHelp.reportSelfie(_SafeStr_4578, _local_6, _roomEngine.activeRoomId, _SafeStr_4579, _SafeStr_4580);
                    };
                    if (_local_5)
                    {
                        reportWindow.destroy();
                    };
                    return;
            };
        }

        private function onDeleteConfirm(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            if (_arg_2.type == "WE_OK")
            {
                ownHandler.deleteCard(_SafeStr_4580);
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.externalimage

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3163 = "_-Lk" (String#9119, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4568 = "_-j1S" (String#7567, DoABC#4)
// _SafeStr_4569 = "_-A9" (String#4504, DoABC#4)
// _SafeStr_4570 = "_-J1V" (String#6993, DoABC#4)
// _SafeStr_4571 = "_-m1F" (String#13152, DoABC#4)
// _SafeStr_4572 = "_-i19" (String#10908, DoABC#4)
// _SafeStr_4573 = "_-E1D" (String#2271, DoABC#4)
// _SafeStr_4574 = "_-h1d" (String#8409, DoABC#4)
// _SafeStr_4575 = "_-Av" (String#9269, DoABC#4)
// _SafeStr_4576 = "_-zp" (String#13226, DoABC#4)
// _SafeStr_4577 = "_-no" (String#13725, DoABC#4)
// _SafeStr_4578 = "_-34" (String#6680, DoABC#4)
// _SafeStr_4579 = "_-021" (String#3552, DoABC#4)
// _SafeStr_4580 = "_-H1b" (String#8405, DoABC#4)
// _SafeStr_9019 = "_-f12" (String#37897, DoABC#4)


