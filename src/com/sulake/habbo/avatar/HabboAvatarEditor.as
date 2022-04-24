// by nota

//com.sulake.habbo.avatar.HabboAvatarEditor

package com.sulake.habbo.avatar
{
    import com.sulake.habbo.avatar.structure._SafeStr_3125;
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.wardrobe.NftOutfit;
    import _-T1p._SafeStr_897;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.habbo.avatar.common.ISideContentModel;
    import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.habbo.avatar.generic.BodyModel;
    import com.sulake.habbo.avatar.head.HeadModel;
    import com.sulake.habbo.avatar.torso.TorsoModel;
    import com.sulake.habbo.avatar.legs.LegsModel;
    import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
    import com.sulake.habbo.avatar.effects.EffectsModel;
    import com.sulake.habbo.avatar.nft.NftAvatarsModel;
    import _-GV._SafeStr_714;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3202;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-GV.SaveUserNftWardrobeMessageComposer;
    import _-3W._SafeStr_638;
    import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
    import com.sulake.habbo.avatar.common.CategoryData;

    public class HabboAvatarEditor 
    {

        public static const DEFAULT_MALE_FIGURE:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
        public static const DEFAULT_FEMALE_FIGURE:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
        private static const MAX_COLOR_LAYERS:int = 2;

        private var _SafeStr_4166:uint;
        private var _SafeStr_4144:HabboAvatarEditorManager;
        private var _SafeStr_5042:_SafeStr_3125;
        private var _SafeStr_3882:AvatarEditorView;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_3921:_SafeStr_24;
        private var _SafeStr_5040:_SafeStr_24;
        private var _SafeStr_5041:Dictionary;
        private var _SafeStr_3834:String = "M";
        private var _figureString:String;
        private var _SafeStr_5043:_SafeStr_3223 = null;
        private var _SafeStr_5047:Boolean = false;
        private var _SafeStr_5045:Boolean = false;
        private var _SafeStr_5044:NftOutfit = null;
        private var _SafeStr_5048:int;
        private var _SafeStr_5046:Boolean = false;
        private var _SafeStr_5039:_SafeStr_897;
        private var _SafeStr_5049:int = 0;
        private var _SafeStr_5052:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
        private var _SafeStr_5053:String = "M";
        private var _SafeStr_5050:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
        private var _SafeStr_5051:String = "M";

        public function HabboAvatarEditor(_arg_1:uint, _arg_2:HabboAvatarEditorManager, _arg_3:Boolean=false)
        {
            _SafeStr_4166 = _arg_1;
            _SafeStr_4144 = _arg_2;
            _SafeStr_5042 = _SafeStr_4144.avatarRenderManager.getFigureData();
            _SafeStr_5046 = _arg_3;
        }

        public function dispose():void
        {
            if (_SafeStr_5039 != null)
            {
                _SafeStr_4144.communication.removeHabboConnectionMessageEvent(_SafeStr_5039);
                _SafeStr_5039 = null;
            };
            if (_SafeStr_3921 != null)
            {
                for each (var _local_2:_SafeStr_3301 in _SafeStr_3921)
                {
                    _local_2.dispose();
                    _local_2 = null;
                };
                _SafeStr_3921 = null;
            };
            if (_SafeStr_5040 != null)
            {
                for each (var _local_1:ISideContentModel in _SafeStr_5040)
                {
                    _local_1.dispose();
                    _local_1 = null;
                };
                _SafeStr_5040 = null;
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _SafeStr_5042 = null;
            _SafeStr_5041 = null;
            _SafeStr_5043 = null;
        }

        private function init(_arg_1:Array=null):void
        {
            if (_SafeStr_3883)
            {
                return;
            };
            _SafeStr_5039 = new _SafeStr_897(onUserNftWardrobeMessage);
            _SafeStr_4144.communication.addHabboConnectionMessageEvent(_SafeStr_5039);
            sendGetSelectedNftWardrobeOutfitMessage();
            _SafeStr_3921 = new _SafeStr_24();
            _SafeStr_5040 = new _SafeStr_24();
            _SafeStr_5040.add("wardrobe", new WardrobeModel(this));
            _SafeStr_3882 = new AvatarEditorView(this, _arg_1);
            _SafeStr_5041 = new Dictionary();
            _SafeStr_5041["M"] = new FigureData(this);
            _SafeStr_5041["F"] = new FigureData(this);
            var _local_3:FigureData = _SafeStr_5041["M"];
            var _local_2:FigureData = _SafeStr_5041["F"];
            _local_3.loadAvatarData("hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007", "M");
            _local_2.loadAvatarData("hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68", "F");
            _SafeStr_3921.add("generic", new BodyModel(this));
            _SafeStr_3921.add("head", new HeadModel(this));
            _SafeStr_3921.add("torso", new TorsoModel(this));
            _SafeStr_3921.add("legs", new LegsModel(this));
            if (((_arg_1 == null) || (_arg_1.indexOf("hotlooks") > -1)))
            {
                _SafeStr_3921.add("hotlooks", new HotLooksModel(this));
            };
            _SafeStr_3921.add("effects", new EffectsModel(this));
            _SafeStr_3921.add("nfts", new NftAvatarsModel(this));
            _SafeStr_3883 = true;
        }

        private function sendGetSelectedNftWardrobeOutfitMessage():void
        {
            _SafeStr_4144.communication.connection.send(new _SafeStr_714());
        }

        private function onUserNftWardrobeMessage(_arg_1:_SafeStr_897):void
        {
            _SafeStr_5049 = _arg_1.getParser().currentTokenId;
            _SafeStr_5052 = _arg_1.getParser().fallbackFigureString;
            _SafeStr_5053 = _arg_1.getParser().fallbackFigureGender;
            if (((hasNftOutfit()) && (!(_SafeStr_3882.currentViewId == "nfts"))))
            {
                loadFallbackFigure();
            };
        }

        public function loadAvatarInEditor(_arg_1:String, _arg_2:String, _arg_3:int=0):void
        {
            switch (_arg_2)
            {
                case "M":
                case "m":
                case "M":
                    _arg_2 = "M";
                    break;
                case "F":
                case "f":
                case "F":
                    _arg_2 = "F";
                    break;
                default:
                    _arg_2 = "M";
            };
            this.clubMemberLevel = _arg_3;
            var _local_4:Boolean;
            var _local_5:FigureData = _SafeStr_5041[_arg_2];
            if (_local_5 == null)
            {
                return;
            };
            _local_5.loadAvatarData(_arg_1, _arg_2);
            if (_arg_2 != this.gender)
            {
                this.gender = _arg_2;
                _local_4 = true;
            };
            if (_figureString != _arg_1)
            {
                _figureString = _arg_1;
                _local_4 = true;
            };
            if (((_SafeStr_3921) && (_local_4)))
            {
                for each (var _local_6:_SafeStr_3301 in _SafeStr_3921)
                {
                    _local_6.reset();
                };
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.update();
            };
        }

        public function getFigureSetType(_arg_1:String):ISetType
        {
            if (_SafeStr_5042 == null)
            {
                return (null);
            };
            return (_SafeStr_5042.getSetType(_arg_1));
        }

        public function getPalette(_arg_1:int):_SafeStr_3202
        {
            if (_SafeStr_5042 == null)
            {
                return (null);
            };
            return (_SafeStr_5042.getPalette(_arg_1));
        }

        public function openWindow(_arg_1:_SafeStr_3223, _arg_2:Array=null, _arg_3:Boolean=false, _arg_4:String=null, _arg_5:String="generic"):_SafeStr_3263
        {
            _SafeStr_5043 = _arg_1;
            _SafeStr_5047 = _arg_3;
            init(_arg_2);
            selectDefaultCategory(_arg_2, _arg_5);
            return (_SafeStr_3882.getFrame(_arg_2, _arg_4));
        }

        public function embedToContext(_arg_1:_SafeStr_3133=null, _arg_2:_SafeStr_3223=null, _arg_3:Array=null, _arg_4:Boolean=false):Boolean
        {
            _SafeStr_5043 = _arg_2;
            _SafeStr_5047 = _arg_4;
            init(_arg_3);
            _SafeStr_3882.embedToContext(_arg_1, _arg_3);
            selectDefaultCategory(_arg_3);
            return (true);
        }

        private function selectDefaultCategory(_arg_1:Array, _arg_2:String="generic"):void
        {
            var _local_3:Boolean = ((!(_arg_1 == null)) && (_arg_1.length > 0));
            if (((!(_arg_2 == null)) && ((!(_local_3)) || (_arg_1.indexOf(_arg_2) >= 0))))
            {
                toggleAvatarEditorPage(_arg_2);
            }
            else
            {
                if (_local_3)
                {
                    toggleAvatarEditorPage(_arg_1[0]);
                }
                else
                {
                    toggleAvatarEditorPage("generic");
                };
            };
        }

        public function get instanceId():uint
        {
            return (_SafeStr_4166);
        }

        public function hide():void
        {
            _SafeStr_3882.hide();
        }

        public function getCategoryWindowContainer(_arg_1:String):_SafeStr_3109
        {
            var _local_2:_SafeStr_3301 = (_SafeStr_3921.getValue(_arg_1) as _SafeStr_3301);
            if (_local_2 != null)
            {
                return (_local_2.getWindowContainer());
            };
            return (null);
        }

        public function activateCategory(_arg_1:String):void
        {
            var _local_2:_SafeStr_3301 = (_SafeStr_3921.getValue(_arg_1) as _SafeStr_3301);
            if (_local_2)
            {
                _local_2.switchCategory();
            };
        }

        public function getSideContentWindowContainer(_arg_1:String):_SafeStr_3133
        {
            var _local_2:ISideContentModel = (_SafeStr_5040.getValue(_arg_1) as ISideContentModel);
            if (_local_2 != null)
            {
                return (_local_2.getWindowContainer());
            };
            return (null);
        }

        public function toggleAvatarEditorPage(_arg_1:String):void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.toggleCategoryView(_arg_1, false);
            };
        }

        public function useClubClothing():void
        {
            if (_SafeStr_3921 == null)
            {
                return;
            };
            update();
        }

        public function disableClubClothing():void
        {
            if (_SafeStr_3921 == null)
            {
                return;
            };
            update();
        }

        public function get figureData():FigureData
        {
            return (_SafeStr_5041[_SafeStr_3834]);
        }

        public function saveCurrentSelection():void
        {
            var _local_1:String = figureData.getFigureString();
            var _local_2:String = figureData.gender;
            if (_SafeStr_5043 != null)
            {
                _SafeStr_5043.saveFigure(_local_1, _local_2);
            }
            else
            {
                if (_SafeStr_5044 != null)
                {
                    _SafeStr_4144.communication.connection.send(new SaveUserNftWardrobeMessageComposer(_SafeStr_5044.tokenId));
                    sendGetSelectedNftWardrobeOutfitMessage();
                    _SafeStr_5044 = null;
                }
                else
                {
                    _SafeStr_4144.communication.connection.send(new _SafeStr_638(_local_1, _local_2));
                };
                if (hasNftOutfit())
                {
                    _SafeStr_5049 = 0;
                };
                _SafeStr_4144.events.dispatchEvent(new AvatarUpdateEvent(_local_1));
                if (_SafeStr_5045)
                {
                    if (figureData.avatarEffectType != -1)
                    {
                        _SafeStr_4144.inventory.setEffectSelected(figureData.avatarEffectType);
                    }
                    else
                    {
                        _SafeStr_4144.inventory.deselectAllEffects(true);
                    };
                };
                _SafeStr_5045 = false;
            };
        }

        public function generateDataContent(_arg_1:_SafeStr_3301, _arg_2:String):CategoryData
        {
            var _local_21:int;
            var _local_14:* = null;
            var _local_9:* = null;
            var _local_22:* = null;
            var _local_10:* = null;
            var _local_13:* = null;
            var _local_12:* = null;
            var _local_19:Boolean;
            var _local_11:int;
            var _local_15:Boolean;
            var _local_18:* = null;
            var _local_26:int;
            var _local_30:* = null;
            var _local_17:int;
            var _local_32:Boolean;
            var _local_33:* = null;
            var _local_25:* = null;
            var _local_24:* = null;
            var _local_29:Boolean;
            var _local_31:* = null;
            var _local_16:int;
            var _local_27:int;
            var _local_6:Boolean;
            var _local_34:Boolean;
            var _local_3:Boolean;
            var _local_20:* = null;
            var _local_23:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            if (!_arg_1)
            {
                return (null);
            };
            if (!_arg_2)
            {
                return (null);
            };
            var _local_4:Array = [];
            var _local_8:Array = [];
            _local_21 = 0;
            while (_local_21 < 2)
            {
                _local_8.push([]);
                _local_21++;
            };
            _local_22 = getFigureSetType(_arg_2);
            if (!_local_22)
            {
                return (null);
            };
            if (_local_22 != null)
            {
                _local_10 = getPalette(_local_22.paletteID);
                if (!_local_10)
                {
                    return (null);
                };
                _local_13 = figureData.getColourIds(_arg_2);
                if (!_local_13)
                {
                    _local_13 = [];
                };
                _local_12 = new Array(_local_13.length);
                _local_19 = showClubItemsDimmedConfiguration();
                for each (var _local_28:IPartColor in _local_10.colors)
                {
                    if (((_local_28.isSelectable) && ((_local_19) || (clubMemberLevel >= _local_28.clubLevel))))
                    {
                        _local_11 = 0;
                        while (_local_11 < 2)
                        {
                            _local_15 = (clubMemberLevel < _local_28.clubLevel);
                            _local_18 = new AvatarEditorGridColorItem((AvatarEditorView.COLOUR_WINDOW.clone() as _SafeStr_3133), _arg_1, _local_28, _local_15);
                            _local_8[_local_11].push(_local_18);
                            _local_11++;
                        };
                        if (_arg_2 != "hd")
                        {
                            _local_26 = 0;
                            while (_local_26 < _local_13.length)
                            {
                                if (_local_28.id == _local_13[_local_26])
                                {
                                    _local_12[_local_26] = _local_28;
                                };
                                _local_26++;
                            };
                        };
                    };
                };
                if (_local_19)
                {
                    _local_17 = 2;
                    _local_30 = _SafeStr_4144.avatarRenderManager.getMandatoryAvatarPartSetIds(gender, _local_17);
                }
                else
                {
                    _local_30 = _SafeStr_4144.avatarRenderManager.getMandatoryAvatarPartSetIds(gender, clubMemberLevel);
                };
                _local_32 = (_local_30.indexOf(_arg_2) == -1);
                if (_local_32)
                {
                    _local_33 = (_SafeStr_4144.windowManager.assets.getAssetByName("avatar_editor_generic_remove_selection") as BitmapDataAsset);
                    _local_25 = (_local_33.content as BitmapData).clone();
                    _local_24 = (AvatarEditorView.THUMB_WINDOW.clone() as _SafeStr_3133);
                    _local_24.name = "REMOVE_ITEM";
                    _local_9 = new AvatarEditorGridPartItem(_local_24, _arg_1, null, null, false);
                    _local_9.iconImage = _local_25;
                    _local_4.push(_local_9);
                };
                _local_29 = (!(_arg_2 == "hd"));
                _local_31 = _local_22.partSets;
                _local_16 = _local_31.length;
                _local_27 = (_local_16 - 1);
                while (_local_27 >= 0)
                {
                    _local_14 = _local_31.getWithIndex(_local_27);
                    _local_6 = false;
                    if (_local_14.gender == "U")
                    {
                        _local_6 = true;
                    }
                    else
                    {
                        if (_local_14.gender == gender)
                        {
                            _local_6 = true;
                        };
                    };
                    if ((((_local_14.isSelectable) && (_local_6)) && ((_local_19) || (clubMemberLevel >= _local_14.clubLevel))))
                    {
                        _local_34 = (clubMemberLevel < _local_14.clubLevel);
                        _local_3 = true;
                        if (_local_14.isSellable)
                        {
                            _local_3 = (((manager.inventory) && (_SafeStr_4144.inventory.hasFigureSetIdInInventory(_local_14.id))) || (isDevelopmentEditor()));
                        };
                        if (_local_3)
                        {
                            _local_9 = new AvatarEditorGridPartItem((AvatarEditorView.THUMB_WINDOW.clone() as _SafeStr_3133), _arg_1, _local_14, _local_12, _local_29, _local_34);
                            _local_4.push(_local_9);
                        };
                    };
                    _local_27--;
                };
            };
            _local_4.sort(((showClubItemsFirst) ? orderByClubDesc : orderByClubAsc));
            if (((_SafeStr_5046) || (_SafeStr_4144.getBoolean("avatareditor.support.sellablefurni"))))
            {
                _local_20 = (_SafeStr_4144.windowManager.assets.getAssetByName("camera_zoom_in") as BitmapDataAsset);
                _local_23 = (_local_20.content as BitmapData).clone();
                _local_7 = (AvatarEditorView.THUMB_WINDOW.clone() as _SafeStr_3133);
                _local_7.name = "GET_MORE";
                _local_9 = new AvatarEditorGridPartItem(_local_7, _arg_1, null, null, false);
                _local_9.iconImage = _local_23;
                _local_4.push(_local_9);
            };
            _local_21 = 0;
            while (_local_21 < 2)
            {
                _local_5 = (_local_8[_local_21] as Array);
                _local_5.sort(orderPaletteByClub);
                _local_21++;
            };
            return (new CategoryData(_local_4, _local_8));
        }

        public function isSideContentEnabled():Boolean
        {
            return (_SafeStr_5047);
        }

        public function hasInvalidClubItems():Boolean
        {
            var _local_1:Boolean;
            for each (var _local_2:_SafeStr_3301 in _SafeStr_3921.getValues())
            {
                _local_1 = _local_2.hasClubItemsOverLevel(clubMemberLevel);
                if (_local_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function hasInvalidSellableItems():Boolean
        {
            var _local_1:Boolean;
            for each (var _local_2:_SafeStr_3301 in _SafeStr_3921.getValues())
            {
                _local_1 = _local_2.hasInvalidSellableItems(_SafeStr_4144.inventory);
                if (_local_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function stripClubItems():void
        {
            for each (var _local_1:_SafeStr_3301 in _SafeStr_3921.getValues())
            {
                _local_1.stripClubItemsOverLevel(clubMemberLevel);
            };
            figureData.updateView();
        }

        public function stripInvalidSellableItems():void
        {
            for each (var _local_1:_SafeStr_3301 in _SafeStr_3921.getValues())
            {
                _local_1.stripInvalidSellableItems();
            };
            figureData.updateView();
        }

        public function getDefaultColour(_arg_1:String):int
        {
            var _local_3:* = null;
            var _local_2:ISetType = getFigureSetType(_arg_1);
            if (_local_2 != null)
            {
                _local_3 = getPalette(_local_2.paletteID);
                for each (var _local_4:IPartColor in _local_3.colors)
                {
                    if (((_local_4.isSelectable) && (clubMemberLevel >= _local_4.clubLevel)))
                    {
                        return (_local_4.id);
                    };
                };
            };
            return (-1);
        }

        private function orderByClubAsc(_arg_1:AvatarEditorGridPartItem, _arg_2:AvatarEditorGridPartItem):Number
        {
            var _local_4:Number = ((_arg_1.partSet == null) ? -1 : _arg_1.partSet.clubLevel);
            var _local_5:Number = ((_arg_2.partSet == null) ? -1 : _arg_2.partSet.clubLevel);
            var _local_6:Boolean = ((_arg_1.partSet == null) ? false : _arg_1.partSet.isSellable);
            var _local_3:Boolean = ((_arg_2.partSet == null) ? false : _arg_2.partSet.isSellable);
            if (((_local_6) && (!(_local_3))))
            {
                return (1);
            };
            if (((_local_3) && (!(_local_6))))
            {
                return (-1);
            };
            if (_local_4 < _local_5)
            {
                return (-1);
            };
            if (_local_4 > _local_5)
            {
                return (1);
            };
            if (_arg_1.partSet.id < _arg_2.partSet.id)
            {
                return (-1);
            };
            if (_arg_1.partSet.id > _arg_2.partSet.id)
            {
                return (1);
            };
            return (0);
        }

        private function orderByClubDesc(_arg_1:AvatarEditorGridPartItem, _arg_2:AvatarEditorGridPartItem):Number
        {
            var _local_4:Number = ((_arg_1.partSet == null) ? 9999999999 : _arg_1.partSet.clubLevel);
            var _local_5:Number = ((_arg_2.partSet == null) ? 9999999999 : _arg_2.partSet.clubLevel);
            var _local_6:Boolean = ((_arg_1.partSet == null) ? false : _arg_1.partSet.isSellable);
            var _local_3:Boolean = ((_arg_2.partSet == null) ? false : _arg_2.partSet.isSellable);
            if (((_local_6) && (!(_local_3))))
            {
                return (1);
            };
            if (((_local_3) && (!(_local_6))))
            {
                return (-1);
            };
            if (_local_4 > _local_5)
            {
                return (-1);
            };
            if (_local_4 < _local_5)
            {
                return (1);
            };
            if (_arg_1.partSet.id > _arg_2.partSet.id)
            {
                return (-1);
            };
            if (_arg_1.partSet.id < _arg_2.partSet.id)
            {
                return (1);
            };
            return (0);
        }

        private function orderPaletteByClub(_arg_1:AvatarEditorGridColorItem, _arg_2:AvatarEditorGridColorItem):Number
        {
            var _local_3:Number = ((_arg_1.partColor == null) ? -1 : (_arg_1.partColor.clubLevel as Number));
            var _local_4:Number = ((_arg_2.partColor == null) ? -1 : (_arg_2.partColor.clubLevel as Number));
            if (_local_3 < _local_4)
            {
                return (-1);
            };
            if (_local_3 > _local_4)
            {
                return (1);
            };
            if (_arg_1.partColor.index < _arg_2.partColor.index)
            {
                return (-1);
            };
            if (_arg_1.partColor.index > _arg_2.partColor.index)
            {
                return (1);
            };
            return (0);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function set gender(_arg_1:String):void
        {
            if (_SafeStr_3834 == _arg_1)
            {
                return;
            };
            _SafeStr_3834 = _arg_1;
            for each (var _local_2:_SafeStr_3301 in _SafeStr_3921)
            {
                _local_2.reset();
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.update();
            };
        }

        public function get handler():AvatarEditorMessageHandler
        {
            return (_SafeStr_4144.handler);
        }

        public function get wardrobe():WardrobeModel
        {
            if (!_SafeStr_3883)
            {
                return (null);
            };
            return (_SafeStr_5040.getValue("wardrobe"));
        }

        public function get effects():EffectsModel
        {
            if (!_SafeStr_3883)
            {
                return (null);
            };
            return (_SafeStr_3921.getValue("effects"));
        }

        public function set clubMemberLevel(_arg_1:int):void
        {
            _SafeStr_5048 = _arg_1;
        }

        public function get clubMemberLevel():int
        {
            if (!_SafeStr_5048)
            {
                return (_SafeStr_4144.sessionData.clubLevel);
            };
            return (_SafeStr_5048);
        }

        public function verifyClubLevel():Boolean
        {
            return (_SafeStr_4144.catalog.verifyClubLevel());
        }

        private function get showClubItemsFirst():Boolean
        {
            return (_SafeStr_4144.getBoolean("avatareditor.show.clubitems.first"));
        }

        private function showClubItemsDimmedConfiguration():Boolean
        {
            return (_SafeStr_4144.getBoolean("avatareditor.show.clubitems.dimmed"));
        }

        public function get manager():HabboAvatarEditorManager
        {
            return (_SafeStr_4144);
        }

        public function update():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            for each (_local_1 in _SafeStr_3921)
            {
                _local_1.reset();
            };
            for each (_local_2 in _SafeStr_5040)
            {
                _local_2.reset();
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.update();
            };
        }

        public function setAvatarEffectType(_arg_1:int):void
        {
            figureData.avatarEffectType = _arg_1;
            figureData.updateView();
            _SafeStr_5045 = true;
        }

        public function setNftOutfit(_arg_1:NftOutfit):void
        {
            _SafeStr_5044 = _arg_1;
            _SafeStr_5050 = figureData.getFigureString();
            _SafeStr_5051 = figureData.gender;
        }

        public function hasSetNftOutfitInViewer():Boolean
        {
            return (!(_SafeStr_5044 == null));
        }

        public function loadNftFigure():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (_SafeStr_5044)
            {
                loadAvatarInEditor(_SafeStr_5044.figure, _SafeStr_5044.gender, _SafeStr_5048);
            }
            else
            {
                if (_SafeStr_5049 > 0)
                {
                    _local_1 = _SafeStr_3921.getValue("nfts");
                    if (_local_1)
                    {
                        _local_2 = _local_1.getNftAvatarByTokenId(_SafeStr_5049);
                        if (_local_2)
                        {
                            setNftOutfit(_local_2);
                            loadAvatarInEditor(_local_2.figure, _local_2.gender, _SafeStr_5048);
                        };
                    };
                };
            };
        }

        public function loadRollbackFigure():void
        {
            if (_SafeStr_5044)
            {
                loadAvatarInEditor(_SafeStr_5050, _SafeStr_5051, _SafeStr_5048);
            };
        }

        public function loadFallbackFigure():void
        {
            if (_SafeStr_5052)
            {
                loadAvatarInEditor(_SafeStr_5052, _SafeStr_5053, _SafeStr_5048);
            };
        }

        public function hasNftOutfit():Boolean
        {
            return (_SafeStr_5049 > 0);
        }

        public function get view():AvatarEditorView
        {
            return (_SafeStr_3882);
        }

        public function openHabboClubAdWindow():void
        {
            if (_SafeStr_4144.catalog)
            {
                _SafeStr_4144.catalog.openClubCenter();
            };
        }

        public function isDevelopmentEditor():Boolean
        {
            return (_SafeStr_4166 == 3);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3202 = "_-P1H" (String#6065, DoABC#4)
// _SafeStr_3223 = "_-Z1v" (String#6974, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4166 = "_-jT" (String#4454, DoABC#4)
// _SafeStr_5039 = "_-e3" (String#10263, DoABC#4)
// _SafeStr_5040 = "_-pW" (String#6978, DoABC#4)
// _SafeStr_5041 = "_-w1O" (String#6644, DoABC#4)
// _SafeStr_5042 = "_-4V" (String#8327, DoABC#4)
// _SafeStr_5043 = "_-I1n" (String#7947, DoABC#4)
// _SafeStr_5044 = "_-Kh" (String#6406, DoABC#4)
// _SafeStr_5045 = "_-2M" (String#13544, DoABC#4)
// _SafeStr_5046 = "_-w1d" (String#19355, DoABC#4)
// _SafeStr_5047 = "_-X4" (String#11988, DoABC#4)
// _SafeStr_5048 = "_-w1F" (String#8457, DoABC#4)
// _SafeStr_5049 = "_-j1J" (String#9347, DoABC#4)
// _SafeStr_5050 = "_-h6" (String#19133, DoABC#4)
// _SafeStr_5051 = "_-30" (String#22405, DoABC#4)
// _SafeStr_5052 = "_-J1R" (String#15771, DoABC#4)
// _SafeStr_5053 = "_-YJ" (String#19192, DoABC#4)
// _SafeStr_638 = "_-p1r" (String#11735, DoABC#4)
// _SafeStr_714 = "_-MA" (String#29969, DoABC#4)
// _SafeStr_897 = "_-L1D" (String#22745, DoABC#4)


