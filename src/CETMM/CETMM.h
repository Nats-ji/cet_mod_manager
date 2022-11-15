#pragma once

#include "Paths.h"
#include "EXT/Mods.h"
#include "EXT/Fonts.h"
#include "EXT/CETMMEXT.h"

class CETMM
{
public:
  static void Initialize();
  static void Shutdown();
  static CETMM& Get();

  static const Paths& GetPaths();
  static Mods& GetMods();
  static Fonts& GetFonts();
  static CETMMEXT& GetCETMMEXT();

  static const bool ShouldRestart();
  static void SetRestart(bool aRestart);

  CETMM(const CETMM&) = delete;
  CETMM(CETMM&&) = delete;
  CETMM& operator=(const CETMM&) = delete;
  CETMM& operator=(CETMM&&) = delete;

private:
  CETMM() {}
  ~CETMM() {}

  void restartGame();
  void uninstall();

  Paths m_paths;
  Mods m_mods;
  Fonts m_fonts;
  CETMMEXT m_cetmmext;
  bool m_restart {false};
};