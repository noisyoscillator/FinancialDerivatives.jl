struct RendlemanBartter <: Model end

"""
Rendleman-Bartter.
"""
function evaluate(IRD::InterestRateDerivative, m::RendlemanBartter, n::Int64 = 12)
    Δt = IRD.t / n
    rates = [IRD.r]
    for i = 0:n
        dr = IRD.θ * rates[end] * Δt + IRD.θ * rates[end] * randn()
        append!(rates, rates[end] + dr)
    end
    return rates
end
