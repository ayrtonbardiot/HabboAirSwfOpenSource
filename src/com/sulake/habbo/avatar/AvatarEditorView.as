// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.AvatarEditorView

package com.sulake.habbo.avatar
{
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components._SafeStr_3263;
    import flash.utils.Timer;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.common._SafeStr_3375;
    import com.sulake.habbo.avatar.view.AvatarEditorNameChangeView;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.common.AvatarEditorGridView;
    import com.sulake.habbo.avatar.effects.AvatarEditorGridViewEffects;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3199;

    public class AvatarEditorView 
    {

        private static const SAVE_TIMEOUT_MS:int = 1500;
        private static const DEFAULT_LOCATION:Point = new Point(100, 30);

        public static var THUMB_WINDOW:_SafeStr_3133;
        public static var COLOUR_WINDOW:_SafeStr_3133;
        public static var TAB_BACKGROUND_COLOUR:int = 0x666666;

        private var _SafeStr_5834:HabboAvatarEditor;
        private var _SafeStr_5832:_SafeStr_3133;
        private var _SafeStr_5836:String;
        private var _SafeStr_5831:ITabContextWindow;
        private var _SafeStr_5833:_SafeStr_3263;
        private var _SafeStr_3728:_SafeStr_3133;
        private var _SafeStr_5829:Timer;
        private var _avatarDirection:int = 4;
        private var _SafeStr_5835:String;
        private var _showWardrobeOnUpdate:Boolean = true;
        private var _SafeStr_5830:Array = [];
        private var _SafeStr_4740:Array = ["generic", "head", "torso", "legs", "hotlooks", "wardrobe", "nfts"];
        private var _categoryContainers:Dictionary;
        private var _SafeStr_5837:_SafeStr_3375;
        private var _SafeStr_5839:_SafeStr_3375;
        private var _SafeStr_5838:AvatarEditorNameChangeView;

        public function AvatarEditorView(_arg_1:HabboAvatarEditor, _arg_2:Array)
        {
            _SafeStr_5834 = _arg_1;
            _SafeStr_5829 = new Timer(1500, 1);
            _SafeStr_5829.addEventListener("timer", onUpdate);
            if (_arg_1.manager.getBoolean("effects.in.avatar.editor"))
            {
                _SafeStr_4740.push("effects");
            };
            if (_arg_2 == null)
            {
                _arg_2 = _SafeStr_4740;
            };
            for each (var _local_3:String in _arg_2)
            {
                _SafeStr_5830.push(_local_3);
            };
            createWindow();
        }

        public function dispose():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_1:* = null;
            if (_SafeStr_5829 != null)
            {
                _SafeStr_5829.stop();
                _SafeStr_5829.removeEventListener("timer", onUpdate);
                _SafeStr_5829 = null;
            };
            if (_SafeStr_5831)
            {
                _SafeStr_5831.dispose();
                _SafeStr_5831 = null;
            };
            if (_SafeStr_5832)
            {
                _SafeStr_5832.dispose();
                _SafeStr_5832 = null;
            };
            if (_SafeStr_3728 != null)
            {
                _SafeStr_3728.dispose();
                _SafeStr_3728 = null;
            };
            if (_SafeStr_5833)
            {
                _SafeStr_5833.dispose();
                _SafeStr_5833 = null;
            };
            if (_SafeStr_5832 != null)
            {
                _local_3 = (_SafeStr_5832.findChildByName("figureContainer") as _SafeStr_3133);
                if (_local_3 != null)
                {
                    while (_local_3.numChildren > 0)
                    {
                        _local_3.removeChildAt(0);
                    };
                };
                _local_2 = (_SafeStr_5832.findChildByName("contentArea") as _SafeStr_3133);
                if (_local_2 != null)
                {
                    while (_local_2.numChildren > 0)
                    {
                        _local_2.removeChildAt(0);
                    };
                };
                _local_1 = (_SafeStr_5832.findChildByName("sideContainer") as _SafeStr_3133);
                if (_local_1 != null)
                {
                    while (_local_1.numChildren > 0)
                    {
                        _local_1.removeChildAt(0);
                    };
                };
                _SafeStr_5834 = null;
            };
        }

        public function getFrame(_arg_1:Array, _arg_2:String=null):_SafeStr_3263
        {
            if (_SafeStr_5833)
            {
                _SafeStr_5833.visible = true;
                _SafeStr_5833.activate();
                return (_SafeStr_5833);
            };
            if (_SafeStr_5833)
            {
                _SafeStr_5833.dispose();
                _SafeStr_5833 = null;
            };
            var _local_3:XmlAsset = (_SafeStr_5834.manager.assets.getAssetByName("AvatarEditorFrame") as XmlAsset);
            if (_local_3)
            {
                _SafeStr_5833 = (_SafeStr_5834.manager.windowManager.buildFromXML((_local_3.content as XML)) as _SafeStr_3263);
            };
            if (_SafeStr_5833 == null)
            {
                return (null);
            };
            var _local_4:_SafeStr_3133 = (_SafeStr_5833.findChildByName("maincontent") as _SafeStr_3133);
            if (!embedToContext(_local_4, _arg_1))
            {
                _SafeStr_5833.dispose();
                _SafeStr_5833 = null;
                return (null);
            };
            if (((_arg_2) && (!(_SafeStr_5833.header == null))))
            {
                _SafeStr_5833.header.title.text = _arg_2;
            };
            _SafeStr_5833.position = DEFAULT_LOCATION;
            _SafeStr_5833.findChildByName("header_button_close").procedure = windowEventProc;
            return (_SafeStr_5833);
        }

        public function embedToContext(_arg_1:_SafeStr_3133, _arg_2:Array):Boolean
        {
            var _local_3:int;
            if (!validateAvailableCategories(_arg_2))
            {
                return (false);
            };
            if (_arg_1)
            {
                _local_3 = _arg_1.getChildIndex(_SafeStr_5832);
                if (_local_3)
                {
                    _arg_1.removeChildAt(_local_3);
                };
                _arg_1.addChild(_SafeStr_5832);
            }
            else
            {
                if (_SafeStr_3728 == null)
                {
                    _SafeStr_3728 = (_SafeStr_5834.manager.windowManager.createWindow("avatarEditorContainer", "", 4, 3, (0x020000 | 0x01), new Rectangle(0, 0, 2, 2), null, 0) as _SafeStr_3133);
                    _SafeStr_3728.addChild(_SafeStr_5832);
                };
                _local_3 = _SafeStr_3728.getChildIndex(_SafeStr_5832);
                if (_local_3)
                {
                    _arg_1.removeChildAt(_local_3);
                };
                _SafeStr_3728.visible = true;
            };
            return (true);
        }

        public function validateAvailableCategories(_arg_1:Array):Boolean
        {
            if (_arg_1 == null)
            {
                return (validateAvailableCategories(_SafeStr_4740));
            };
            if (_arg_1.length != _SafeStr_5830.length)
            {
                return (false);
            };
            for each (var _local_2:String in _arg_1)
            {
                if (_SafeStr_5830.indexOf(_local_2) < 0)
                {
                    return (false);
                };
            };
            return (true);
        }

        private function onUpdate(_arg_1:Event=null):void
        {
            _SafeStr_5829.stop();
            if (_SafeStr_5832)
            {
                _SafeStr_5832.findChildByName("save").enable();
            };
        }

        public function show():void
        {
            if (_SafeStr_5833)
            {
                _SafeStr_5833.visible = true;
            }
            else
            {
                if (_SafeStr_5832)
                {
                    _SafeStr_5832.visible = true;
                };
            };
        }

        public function hide():void
        {
            if (_SafeStr_5833)
            {
                _SafeStr_5833.visible = false;
            }
            else
            {
                if (_SafeStr_5832)
                {
                    _SafeStr_5832.visible = false;
                };
            };
        }

        private function createWindow():void
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_5:int;
            var _local_7:* = null;
            if (_SafeStr_5832 == null)
            {
                _SafeStr_5832 = (_SafeStr_5834.manager.windowManager.buildFromXML(((_SafeStr_5834.manager.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML)) as _SafeStr_3133);
            };
            if (THUMB_WINDOW == null)
            {
                THUMB_WINDOW = (_SafeStr_5832.findChildByName("thumb_template") as _SafeStr_3133);
                if (THUMB_WINDOW)
                {
                    _SafeStr_5832.removeChild(THUMB_WINDOW);
                };
            };
            if (COLOUR_WINDOW == null)
            {
                COLOUR_WINDOW = (_SafeStr_5832.findChildByName("palette_template") as _SafeStr_3133);
                if (COLOUR_WINDOW)
                {
                    _SafeStr_5832.removeChild(COLOUR_WINDOW);
                };
            };
            if (((!(_SafeStr_5834.manager == null)) && (!(_SafeStr_5834.manager.sessionData == null))))
            {
                _SafeStr_5832.findChildByName("avatar_name").caption = _SafeStr_5834.manager.sessionData.userName;
                if (_SafeStr_5834.manager.getBoolean("premium.name.change.enabled"))
                {
                    _SafeStr_5832.findChildByName("avatar_name_change").visible = true;
                };
            };
            _SafeStr_5832.procedure = windowEventProc;
            _SafeStr_5831 = (_SafeStr_5832.findChildByName("mainTabs") as ITabContextWindow);
            var _local_1:Vector.<String> = new Vector.<String>(0);
            _local_4 = (_SafeStr_5831.numTabItems - 1);
            while (_local_4 >= 0)
            {
                _local_3 = _SafeStr_5831.getTabItemAt(_local_4);
                _local_1.push(_local_3.name);
                if (((!(_local_3 == null)) && (_SafeStr_5830.indexOf(_local_3.name) < 0)))
                {
                    _SafeStr_5831.removeTabItem(_local_3);
                    _local_5 = (_local_4 + 1);
                    while (_local_5 < _SafeStr_5831.numTabItems)
                    {
                        _SafeStr_5831.getTabItemAt(_local_5).x = (_SafeStr_5831.getTabItemAt(_local_5).x - _local_3.width);
                        _local_5++;
                    };
                };
                _local_4--;
            };
            _categoryContainers = new Dictionary();
            var _local_2:_SafeStr_3133 = (_SafeStr_5832.findChildByName("contentArea") as _SafeStr_3133);
            for each (var _local_6:String in _local_1)
            {
                _local_7 = _local_2.findChildByName((_local_6 + "_content"));
                if (_local_7)
                {
                    _categoryContainers[_local_6] = _local_2.removeChild(_local_7);
                };
            };
            _SafeStr_5837 = new AvatarEditorGridView((_SafeStr_5832.findChildByName("grid_container") as _SafeStr_3133));
            _SafeStr_5839 = new AvatarEditorGridViewEffects((_SafeStr_5832.findChildByName("grid_container") as _SafeStr_3133));
            _SafeStr_5831.selector.setSelected(_SafeStr_5831.getTabItemAt(0));
            update();
        }

        public function update():void
        {
            var _local_1:_SafeStr_3109 = (_SafeStr_5832.findChildByName("wardrobeButtonContainer") as _SafeStr_3109);
            if (((_local_1) && (_SafeStr_5834.manager.sessionData)))
            {
                _local_1.visible = ((_SafeStr_5834.manager.sessionData.hasClub) && (_SafeStr_5834.isSideContentEnabled()));
                _local_1.visible = _SafeStr_5834.isSideContentEnabled();
            };
            var _local_2:String = "nothing";
            if (((_SafeStr_5835 == "wardrobe") || (_showWardrobeOnUpdate)))
            {
                _local_2 = "wardrobe";
            };
            if (!_SafeStr_5834.isSideContentEnabled())
            {
                _local_2 = "nothing";
            };
            if (_SafeStr_5834.hasInvalidClubItems())
            {
                _SafeStr_5834.stripClubItems();
                _SafeStr_5834.disableClubClothing();
            };
            if (_SafeStr_5834.hasInvalidSellableItems())
            {
                _SafeStr_5834.stripInvalidSellableItems();
            };
            setSideContent(_local_2);
            setViewToCategory(_SafeStr_5836);
        }

        public function toggleCategoryView(_arg_1:String, _arg_2:Boolean=false):void
        {
            if (_arg_2)
            {
            };
            setViewToCategory(_arg_1);
        }

        private function toggleWardrobe():void
        {
            if (_SafeStr_5835 == "wardrobe")
            {
                _showWardrobeOnUpdate = false;
                setSideContent("nothing");
            }
            else
            {
                setSideContent("wardrobe");
            };
        }

        private function setSideContent(_arg_1:String):void
        {
            var _local_5:int;
            if (_SafeStr_5835 == _arg_1)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_SafeStr_5832.findChildByName("sideContainer") as _SafeStr_3133);
            if (!_local_2)
            {
                return;
            };
            var _local_4:_SafeStr_3109;
            switch (_arg_1)
            {
                case "nothing":
                    break;
                case "wardrobe":
                    _local_4 = _SafeStr_5834.getSideContentWindowContainer("wardrobe");
            };
            var _local_3:_SafeStr_3109 = _local_2.removeChildAt(0);
            if (_local_3)
            {
                _SafeStr_5832.width = (_SafeStr_5832.width - _local_3.width);
            };
            if (_local_4)
            {
                _local_2.addChild(_local_4);
                _local_4.visible = true;
                _local_2.width = _local_4.width;
            }
            else
            {
                _local_2.width = 0;
            };
            _SafeStr_5835 = _arg_1;
            if (_SafeStr_5833)
            {
                _local_5 = 8;
                _SafeStr_5833.content.width = (_SafeStr_5832.width + _local_5);
            };
        }

        private function setViewToCategory(_arg_1:String):void
        {
            if (((_arg_1 == null) || (_arg_1 == "")))
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_SafeStr_5832.findChildByName("contentArea") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            effectsParamViewContainer.visible = (_arg_1 == "effects");
            if ("nfts" == _arg_1)
            {
                _showWardrobeOnUpdate = false;
                _SafeStr_5832.findChildByName("wardrobe").disable();
                setSideContent("nothing");
            }
            else
            {
                _SafeStr_5832.findChildByName("wardrobe").enable();
            };
            var _local_4:_SafeStr_3109 = _local_2.getChildAt(0);
            _local_2.removeChild(_local_4);
            _local_2.invalidate();
            var _local_3:_SafeStr_3109 = _SafeStr_5834.getCategoryWindowContainer(_arg_1);
            if (_local_3 == null)
            {
                return;
            };
            _SafeStr_5837.window.visible = false;
            _local_3.visible = true;
            _local_2.addChild(_local_3);
            _SafeStr_5834.activateCategory(_arg_1);
            _SafeStr_5836 = _arg_1;
            _SafeStr_5831.selector.setSelected(_SafeStr_5831.getTabItemByName(_arg_1));
        }

        public function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_6:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            if (_arg_1.type == "WE_SELECTED")
            {
                _local_3 = (_arg_2 as ITabContextWindow).selector.getSelected().name;
                if (_local_3 != _SafeStr_5836)
                {
                    _local_6 = false;
                    _local_4 = false;
                    _local_5 = false;
                    if (((!(_local_3 == "effects")) && (!(_local_3 == "hotlooks"))))
                    {
                        if (((_SafeStr_5834.hasNftOutfit()) && ("nfts" == _local_3)))
                        {
                            _local_5 = true;
                        }
                        else
                        {
                            if (((_SafeStr_5834.hasNftOutfit()) && (!(_local_3 == "nfts"))))
                            {
                                _local_6 = true;
                            }
                            else
                            {
                                if (((editor.hasSetNftOutfitInViewer()) && (!(_local_3 == "nfts"))))
                                {
                                    _local_4 = true;
                                };
                            };
                        };
                    };
                    if (((_SafeStr_5834.hasNftOutfit()) && (_local_3 == "effects")))
                    {
                        _local_5 = true;
                    };
                    _SafeStr_5834.toggleAvatarEditorPage(_local_3);
                    if (_local_6)
                    {
                        _SafeStr_5834.loadFallbackFigure();
                    }
                    else
                    {
                        if (_local_4)
                        {
                            _SafeStr_5834.loadRollbackFigure();
                        }
                        else
                        {
                            if (_local_5)
                            {
                                _SafeStr_5834.loadNftFigure();
                            };
                        };
                    };
                };
            }
            else
            {
                if (_arg_1.type == "WME_CLICK")
                {
                    switch (_arg_2.name)
                    {
                        case "save":
                            if (((!(_SafeStr_5834.isDevelopmentEditor())) && (_SafeStr_5834.hasInvalidSellableItems())))
                            {
                                startSellablePurchase();
                                _SafeStr_5829.start();
                                _SafeStr_5832.findChildByName("save").disable();
                                return;
                            };
                            if (((!(_SafeStr_5834.isDevelopmentEditor())) && (_SafeStr_5834.hasInvalidClubItems())))
                            {
                                _SafeStr_5834.openHabboClubAdWindow();
                                _SafeStr_5829.start();
                                _SafeStr_5832.findChildByName("save").disable();
                                return;
                            };
                            _SafeStr_5829.start();
                            _SafeStr_5832.findChildByName("save").disable();
                            _SafeStr_5834.saveCurrentSelection();
                            _SafeStr_5834.manager.close(_SafeStr_5834.instanceId);
                            return;
                        case "cancel":
                        case "header_button_close":
                            if (_SafeStr_5834.hasInvalidClubItems())
                            {
                                _SafeStr_5834.stripClubItems();
                                _SafeStr_5834.disableClubClothing();
                            };
                            _SafeStr_5834.manager.close(_SafeStr_5834.instanceId);
                            return;
                        case "rotate_avatar":
                            _avatarDirection++;
                            if (_avatarDirection > 7)
                            {
                                _avatarDirection = 0;
                            };
                            _SafeStr_5834.figureData.direction = _avatarDirection;
                            return;
                        case "wardrobe":
                            toggleWardrobe();
                            return;
                        case "avatar_name_change":
                            if (_SafeStr_5838 != null)
                            {
                                _SafeStr_5838.focus();
                            }
                            else
                            {
                                _SafeStr_5838 = new AvatarEditorNameChangeView(this, (_SafeStr_5832.x + _SafeStr_5832.width), _SafeStr_5832.y);
                            };
                            return;
                    };
                };
            };
        }

        private function startSellablePurchase():void
        {
            if (_SafeStr_5834.manager.catalog)
            {
                _SafeStr_5834.manager.catalog.openCatalogPage(_SafeStr_5834.manager.getProperty("catalog.clothes.page"));
            };
        }

        public function get effectsParamViewContainer():_SafeStr_3133
        {
            return (_SafeStr_3133(_SafeStr_5832.findChildByName("effectParamsContainer")));
        }

        public function getCategoryContainer(_arg_1:String):_SafeStr_3109
        {
            return (_categoryContainers[_arg_1]);
        }

        public function get gridView():_SafeStr_3375
        {
            return (_SafeStr_5837);
        }

        public function getFigureContainer():_SafeStr_3199
        {
            return (_SafeStr_5832.findChildByName("avatarWidget") as _SafeStr_3199);
        }

        public function get effectsGridView():_SafeStr_3375
        {
            return (_SafeStr_5839);
        }

        public function get editor():HabboAvatarEditor
        {
            return (_SafeStr_5834);
        }

        public function get avatarEditorNameChangeView():AvatarEditorNameChangeView
        {
            return (_SafeStr_5838);
        }

        public function get currentViewId():String
        {
            return (_SafeStr_5836);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3375 = "_-n1X" (String#8106, DoABC#4)
// _SafeStr_3728 = "_-B1C" (String#3610, DoABC#4)
// _SafeStr_4740 = "_-71U" (String#4977, DoABC#4)
// _SafeStr_5829 = "_-N1A" (String#5625, DoABC#4)
// _SafeStr_5830 = "_-E1V" (String#11290, DoABC#4)
// _SafeStr_5831 = "_-9L" (String#4556, DoABC#4)
// _SafeStr_5832 = "_-7K" (String#1881, DoABC#4)
// _SafeStr_5833 = "_-eW" (String#2685, DoABC#4)
// _SafeStr_5834 = "_-S1F" (String#1780, DoABC#4)
// _SafeStr_5835 = "_-2" (String#12027, DoABC#4)
// _SafeStr_5836 = "_-V18" (String#13419, DoABC#4)
// _SafeStr_5837 = "_-Xg" (String#3116, DoABC#4)
// _SafeStr_5838 = "_-ol" (String#12504, DoABC#4)
// _SafeStr_5839 = "_-NB" (String#18956, DoABC#4)


