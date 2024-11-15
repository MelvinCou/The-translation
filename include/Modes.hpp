
#ifndef MODES_HPP
#define MODES_HPP

enum class ModeTypes 
{
    MAINTENANCE,
    PRODUCTION,
    CONFIGURATION
};

class Mode
{
public:
    Mode();
    ~Mode();

    void begin();
    void update();
    void startConfiguration();
    void startProduction();
    void startMaintenance();
    ModeTypes getCurrentModeType();

private:
    ModeTypes m_modeType;
};

#endif // MODES_HPP
